function condStruct = arModelConditions(iModel, evalExpressions)
% ARMODELCONDITIONS returns a struct with the parameter replacements for the model and the conditions
%
% INPUTS:
%   iModel (1,1) double = 1: index of the model
%   evalExpressions (1,1) logical = false: if true, the replacements are evaluated
%       This is relevant for for replacements where the formula can be further reduced
%       e.g. 1*param1 -> param1; 0 * param1 -> 0; param1 / param1 -> 1
%       This seems irrelevant at first, but e.g. the model Bachmann_MSB2011 has redundant
%       conditions that can only be detected if the replacements are evaluated.
%      

%% NOTE:
% ar.model(iModel).fp contains all parameter replacements from the model(iModel).def file
% ar.model(iModel).condition.fp contains all parameter replacementrs from the
% data.def file or the data tables

arguments
    iModel (1,1) double = 1
    evalExpressions (1,1) logical = false
end


global ar %#ok<*GVMIS>
condStruct = struct();

%% replacements for the whole model
% define parameters and their replacements
modelP = ar.model(iModel).p;
modelFp = ar.model(iModel).fp';

% evaluate the replacements (if desired)
if evalExpressions
    modelFpStrings = string(arSym(modelFp));
    modelFp = arrayfun(@(x) char(x), modelFpStrings, 'UniformOutput', false);
end

% remove parameters that are not replaced
qReplaced = ~strcmp(modelP, modelFp);
modelReplace = [modelP(qReplaced), modelFp(qReplaced)];
condStruct.modelReplace = modelReplace;


%% condition specific replacements
condStruct.condReplace = {};
for c = 1:length(ar.model(iModel).condition)
    % define parameters and their replacements
    condPold = ar.model(iModel).condition(c).pold';
    condFp = ar.model(iModel).condition(c).fp;

    % evaluate the replacements (if desired)
    if evalExpressions
        condFpStrings = string(arSym(condFp));
        condFp = arrayfun(@(x) char(x), condFpStrings, 'UniformOutput', false);
    end

    % remove parameters that are not replaced
    qCondReplaced = ~strcmp(condPold, condFp);
    condReplace = [condPold(qCondReplaced), condFp(qCondReplaced)];

    % reduce to new replacements, i.e.,
    % - replacements for parameters that are not replaced in the model.def
    % - replacements that overwrite the replacements from the model.def
    [~, idCondDataDef] = setdiff(join(condReplace, 2), join(modelReplace, 2), 'stable');
    condReplace = condReplace(idCondDataDef, :);

    % add to struct
    condStruct.condReplace(c) = {condReplace};
end

end
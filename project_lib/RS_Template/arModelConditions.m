function condStruct = arModelConditions(iModel)

%% NOTE:
% ar.model(iModel).fp contains all parameter replacements from the model(iModel).def file
% ar.model(iModel).condition.fp contains all parameter replacementrs from the
% data.def file or the data tables

arguments
    iModel (1,1) double = 1
end


global ar %#ok<*GVMIS>

condStruct = struct();

% replacements for the whole model
modelReplace = [ar.model(iModel).p, ar.model(iModel).fp'];
modelReplace = modelReplace(~strcmp(modelReplace(:, 1), modelReplace(:, 2)), :);
condStruct.modelReplace = modelReplace;

% model condition specific replacements
condStruct.condReplace = {};
for c = 1:length(ar.model(iModel).condition)
    % all parameters and their replacements
    condReplace = [ar.model(iModel).condition(c).pold', ar.model(iModel).condition(c).fp];  
    % remove parameters that are not replaced
    condReplace = condReplace(~strcmp(condReplace(:,1), condReplace(:,2)), :);

    % reduce to new replacements, i.e.,
    % - replacements for parameters that are not replaced in the model.def
    % - replacements that overwrite the replacements from the model.def
    [~, idCondDataDef] = setdiff(join(condReplace, 2), join(modelReplace, 2), 'stable');
    condReplace = condReplace(idCondDataDef, :);

    % add to struct
    condStruct.condReplace(c) = {condReplace};
end

end
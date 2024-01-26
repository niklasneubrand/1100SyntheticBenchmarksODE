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
globalReplace = [ar.model(iModel).p, ar.model(iModel).fp'];
globalReplace = globalReplace(~strcmp(globalReplace(:, 1), globalReplace(:, 2)), :);
condStruct.globalReplace = globalReplace;

% model condition specific replacements
condStruct.condReplace = {};
for c = 1:length(ar.model(iModel).condition)
    % all parameters and their replacements
    condReplace = [ar.model(iModel).condition(c).pold', ar.model(iModel).condition(c).fp];  
    % remove parameters that are not replaced
    condReplace = condReplace(~strcmp(condReplace(:,1), condReplace(:,2)), :);

    % reduce to parameters that are not replaced in the model(iModel).def
    [~, idCondDataDef] = setdiff(join(condReplace, 2), join(globalReplace, 2), 'stable');
    condReplace = condReplace(idCondDataDef, :);

    % add to struct
    condStruct.condReplace(c) = {condReplace};
end

end
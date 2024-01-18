function condStruct = arModelConditions

%% NOTE:
% ar.model.fp contains all parameter replacements from the model.def file
% ar.model.condition.fp contains all parameter replacementrs from the
% data.def file or the data tables


global ar %#ok<*GVMIS>

condStruct = struct();

% replacements for the whole model
globalReplace = [ar.model.p, ar.model.fp'];
globalReplace = globalReplace(~strcmp(globalReplace(:,1), globalReplace(:,2)), :);
condStruct.globalReplace = globalReplace;

% model condition specific replacements
condStruct.condReplace = {};
for c = 1:length(ar.model.condition)
    % all parameters and their replacements
    condReplace = [ar.model.condition(c).pold', ar.model.condition(c).fp];  
    % remove parameters that are not replaced
    condReplace = condReplace(~strcmp(condReplace(:,1), condReplace(:,2)), :);

    % reduce to parameters that are not replaced in the model.def
    [~, idCondDataDef] = setdiff(join(condReplace, 2), join(globalReplace, 2), 'stable');
    condReplace = condReplace(idCondDataDef, :);

    % add to struct
    condStruct.condReplace(c) = {condReplace};
end


end
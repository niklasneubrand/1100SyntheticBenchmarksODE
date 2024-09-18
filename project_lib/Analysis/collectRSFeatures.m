function feats = collectRSFeatures()

    global ar

    feats = struct();

    % get the name of the model
    feats.modelName = string(ar.info.name);

    % get parameter features from ar
    feats.nParams = length(ar.p);
    feats.nParamsDyn = sum(ar.qDynamic);
    feats.nParamsInit = sum(ar.qInitial);
    feats.nParamsErr = sum(ar.qError);
    feats.nParamsFit = sum(ar.qFit~=0);

    % get model features from ar.model
    feats.nStates = length(ar.model.x);
    feats.nInputs = length(ar.model.u);

    % get the condition/data features from ar.model.data
    
    rsTemplate = arCreateRSTemplate(true, true, true);

    feats.nConds = length(ar.model.condition);
    feats.nExp = rsTemplate.nExp;
    feats.nDataPoints = sum([ar.model.data.ndata]);

    % analyze condObsMatrix (sparsity of oservations)
    CondObsMatrix = rsTemplate.condObsMatrix;
    nanSparsity = @(mat) sum(~isnan(mat(:)))/numel(mat);
    feats.designSparsity = nanSparsity(CondObsMatrix);
    

end
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
    feats.nConds = length(ar.model.condition);
    rsTemplate = arCreateRSTemplate(false, false, false);
    feats.nExp = rsTemplate.nExp;
    feats.nDataPoints = sum([ar.model.data.ndata]);

    %feats.nObsPerCond = cellfun(@length, {ar.model.data.fy});
    %feats.nTimeCourses = sum(feats.nObsPerCond);
    %feats.nDataPerTimeCourse = {ar.model.data.ndata};
    %feats.nDataPerCond = cellfun(@sum, feats.nDataPerTimeCourse);
    %feats.logfitting = {ar.model.data.logfitting};

    % load the obsStruct
    %load(fullfile('Auxillary', sprintf('obsStruct_%s.mat', ar.info.name)));
    %feats.obsStruct = obsStruct;

    % calculate sparsity of the observations

    try
        % for realistic simulations look here
        load(fullfile('Auxillary', sprintf('obsStruct_%s.mat', ar.info.name)))
        CondObsMatrix = obsStruct.CondObsMatrix;
    catch
        % for base models look here
        try
            load(fullfile('CondObsStructure', sprintf('CondObsMatrix_M%i.mat', 1)))
        catch
            % if the file is not found, run the function
            arCondObsStructure();
            load(fullfile('CondObsStructure', 'CondObsMatrix_M1'), 'CondObsMatrix');
        end
    end    
    nanSparsity = @(mat) sum(~isnan(mat(:)))/numel(mat);
    feats.designSparsity = nanSparsity(CondObsMatrix);

end
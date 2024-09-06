function arRealisticTimesDR(rngSeed, RSTemplateOld)

global ar %#ok<GVMIS>

% change the random number generator seed to get samples independent of the TC data
if isnumeric(rngSeed)
    rngSeed = rngSeed + RSTemplateOld.nTC + 1;
    rng(rngSeed);
end

%% ranomize time-points and replicate number for dose-response data
% for the time points
amplitude = 2;
factors = amplitude.^(1 - 2*rand(1, RSTemplateOld.nDR));

% Poisson: lambda = mean and lambda = variance
% I want to draw data around repMaean with variance repVar
% to do this I add a offset to the Poisson distributed values
% repMean = mean([RSTemplateOld.doseResponse(:).nReplica]);
% repVar = var([RSTemplateOld.doseResponse(:).nReplica]);
% lambda = repVar;
% offset = max(1, repMean - lambda);  % offset must be positive
% RSTemplateOld.doseResponse(dr).nReplica = offset + poissrnd(lambda, 1, nDoses);

for dr = 1:RSTemplateOld.nDR
    % multiply times with random factors between 1/2 and 2 from log-uniform distribution
    RSTemplateOld.doseResponse(dr).tExp = RSTemplateOld.doseResponse(dr).tExp * factors(dr);
    RSTemplateOld.doseResponse(dr).tExp = ceil(round(RSTemplateOld.doseResponse(dr).tExp, 2, 'significant'));

    % draw random number of replicas from the RSTemplate (with replacement)
    nDoses = length(RSTemplateOld.doseResponse(dr).nReplica);
    randInd = randi(nDoses, 1, nDoses);
    RSTemplateOld.doseResponse(dr).nReplica = RSTemplateOld.doseResponse(dr).nReplica(randInd);
end

%% the RSTemplateOld cannot be used to assign the timepoints
% the dLink is based on the RSTemplateOld model not the newly compiled data
% therefore, calculate RSTemplate for the new model

templateNew = arCreateRSTemplate(false, false);

for dr = 1:templateNew.nDR

    % get the data indices
    d = templateNew.doseResponse(dr).dLink;

    % randomized time point and number of replicas
    tExp = RSTemplateOld.doseResponse(dr).tExp;
    nReplica = RSTemplateOld.doseResponse(dr).nReplica;

    % set the time points and dummy data
    for id = 1:length(d)
        tDR = repmat(tExp, nReplica(id), 1);
        ar.model.data(d(id)).tExp = tDR;

        nObs = length(ar.model.data(d(id)).y);
        ySize = [nReplica(id), nObs];

        ar.model.data(d(id)).yExp = rand(ySize);
        ar.model.data(d(id)).yExpSimu = nan(ySize);
        
        ar.model.data(d(id)).yExpStd = nan(ySize);
        ar.model.data(d(id)).ystdExpSimu = nan(ySize);

        ar.model.data(d(id)).yExpRaw = rand(ySize);
        ar.model.data(d(id)).yExpStdRaw = nan(ySize);
    end

end

arLink();

end
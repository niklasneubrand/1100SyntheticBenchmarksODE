function arRealisticTimesDR(rngSeed, templateOld)

global ar %#ok<GVMIS>

% change the random number generator seed to get samples independent of the TC data
if isnumeric(rngSeed)
    rngSeed = rngSeed + templateOld.nTC + 1;
    rng(rngSeed);
end

%% ranomize time-points and replicate number for dose-response data
% for the time points
amplitude = 2;
factors = amplitude.^(1 - 2*rand(1, templateOld.nDR));

% Poisson: lambda = mean and lambda = variance
% I want to draw data around repMaean with variance repVar
% to do this I add a offset to the Poisson distributed values

repMean = mean([templateOld.doseResponse(:).nReplica]);
repVar = var([templateOld.doseResponse(:).nReplica]);
lambda = repVar;
offset = max(1, repMean - lambda);  % offset must be positive

for dr = 1:templateOld.nDR
    % multiply times with random factors between 1/2 and 2 from log-uniform distribution
    templateOld.doseResponse(dr).tExp = templateOld.doseResponse(dr).tExp * factors(dr);
    templateOld.doseResponse(dr).tExp = ceil(round(templateOld.doseResponse(dr).tExp, 2, 'significant'));

    % draw random number of replicas from Poisson distribution
    nDoses = length(templateOld.doseResponse(dr).nReplica);
    templateOld.doseResponse(dr).nReplica = offset + poissrnd(lambda, 1, nDoses);
end

%% the templateOld cannot be used to assign the timepoints
% the dLink is based on the templateOld model not the newly compiled data
% therefore, calculate template for the new model

templateNew = createTemplate(false, false);

for dr = 1:templateNew.nDR

    % get the data indices
    d = templateNew.doseResponse(dr).dLink;

    % randomized time point and number of replicas
    tExp = templateOld.doseResponse(dr).tExp;
    nReplica = templateOld.doseResponse(dr).nReplica;

    % set the time points and dummy data
    for id = 1:length(d)
        tDR = repmat(tExp, nReplica(id), 1);
        ar.model.data(d(id)).tExp = tDR;

        nObs = length(ar.model.data(d(id)).yExp);
        ar.model.data(d(id)).yExp = rand(nReplica(id), nObs);
        ar.model.data(d(id)).yExpStd = nan(nReplica(id), nObs);
    end

end

arLink();

end
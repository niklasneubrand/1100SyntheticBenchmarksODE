function arRealisticData(projectName, rngSeed)

arguments
    projectName (1,:) char = 'Realistic001'
    rngSeed (1,:) = 'shuffle'
end

global ar  %#ok<*GVMIS>

%% simulate data
for m = 1:length(ar.model)
    % arSimuData arguments:
    % jplot=[]  -> loop through all plots (hence through all data sets)
    % tT=[]     -> time points from ar, already set in arRealisticTimesRTF
    % arSimuData(m, [], [], rngSeed);
    
    % do the data simulation
    for jplot = 1:length(ar.model(m).plot)
        arSimuData(m, jplot, [], rngSeed);
        if isnumeric(rngSeed)
            % change seed for next data set
            rngSeed = rngSeed + 1;
        end
    end
end

%% modify the simulated data
for m = 1:length(ar.model)
    for d = 1:length(ar.model(m).data)

        % overwrite time-points that should not have been simulated
        if isfield(ar.model(m).data(d), 'tT') && ~isempty(ar.model(m).data(d).tT)
            for iObs = 1:size(ar.model(m).data(d).yExp, 2)
                tSimu = ar.model(m).data(d).tT(:, iObs);
                tSimu = tSimu(~isnan(tSimu));
                for iExp = 1:length(ar.model(m).data(d).tExp)
                    % if tExp is not in tSimu -> remove the simulated data point
                    if ~ismember(ar.model(m).data(d).tExp(iExp), tSimu)
                        ar.model(m).data(d).yExp(iExp, iObs) = NaN;
                    end
                end
            end
        end

        % overwrite experimental error bars (have to be fitted)
        ar.model(m).data(d).yExpStd = nan(size(ar.model(m).data(d).yExp));

        % make sure the data on the correct scale (lin or log)
        % always store data on the lin scale!
        log10Obs = logical(ar.model(m).data(d).logplotting);
        ar.model(m).data(d).yExp(:, log10Obs) = 10.^ar.model(m).data(d).yExp(:, log10Obs);
    end
end


%% save the data as xls files

newTemplate = createTemplate(false, false, false);
nTC = newTemplate.nTC;
nDR = newTemplate.nDR;


% time-course data
for tc = 1:nTC

    m = 1;
    d = newTemplate.timeCourse(tc).dLink;

    header = [{ar.model.t}, ar.model(m).data(d).y];
    data = num2cell([ar.model(m).data(d).tExp, ar.model(m).data(d).yExp]);
    filePath = fullfile('Data', sprintf('%s_TC%d.csv', projectName, tc));    
    writecell([header; data], filePath);

end

% dose-response data

for dr = 1:nDR

    m = 1;
    d = newTemplate.doseResponse(dr).dLink;

    tVar = {ar.model.t};
    respVar = {newTemplate.doseResponse(dr).response_parameter};
    obs = ar.model(m).data(d).y;
    header = [tVar, respVar, obs];

    % response value
    respVal = [];
    for id = 1:length(d)
        val = newTemplate.doseResponse(dr).values(id);
        nRep = newTemplate.doseResponse(dr).nReplica(id);
        respVal = [respVal; repmat(val, nRep, 1)];
    end

    tExp = vertcat(ar.model(m).data(d).tExp);
    yExp = vertcat(ar.model(m).data(d).yExp);
    data = num2cell([tExp, respVal, yExp]);

    filePath = fullfile('Data', sprintf('%s_DR%d.csv', projectName, dr));
    writecell([header; data], filePath);

end


arLink();

end
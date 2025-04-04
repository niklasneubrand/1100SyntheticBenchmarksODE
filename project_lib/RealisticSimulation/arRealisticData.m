function arRealisticData(projectName, rngSeed)

arguments
    projectName (1,:) char = 'Realistic001'
    rngSeed (1,:) = 'shuffle'
end

global ar  %#ok<*GVMIS>

%% Simlate the model at tExp and potentially adjust configs
[simuSuccess, configSuccess, errReport] = arSimuMultiTries();
if simuSuccess
    % replace the previous configs by the successful configs
    configs = fieldnames(configSuccess);
    for i = 1:length(configs)
        ar.config.(configs{i}) = configSuccess.(configs{i});
    end
else
    warning(errReport)
end

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
    for dLink = 1:length(ar.model(m).data)

        % overwrite time-points that should not have been simulated
        if isfield(ar.model(m).data(dLink), 'tT') && ~isempty(ar.model(m).data(dLink).tT)
            for iObs = 1:size(ar.model(m).data(dLink).yExp, 2)
                tSimu = ar.model(m).data(dLink).tT(:, iObs);
                tSimu = tSimu(~isnan(tSimu));
                for iExp = 1:length(ar.model(m).data(dLink).tExp)
                    % if tExp is not in tSimu -> remove the simulated data point
                    if ~ismember(ar.model(m).data(dLink).tExp(iExp), tSimu)
                        ar.model(m).data(dLink).yExp(iExp, iObs) = NaN;
                    end
                end
            end
        end

        % overwrite experimental error bars (have to be fitted)
        ar.model(m).data(dLink).yExpStd = nan(size(ar.model(m).data(dLink).yExp));

        % make sure the data on the correct scale (lin or log)
        % always store data on the lin scale!
        log10Obs = logical(ar.model(m).data(dLink).logplotting);
        ar.model(m).data(dLink).yExpRaw = ar.model(m).data(dLink).yExp;
        ar.model(m).data(dLink).yExpRaw(:, log10Obs) = 10.^ar.model(m).data(dLink).yExp(:, log10Obs);
    end
end


%% save the data as xls files

RSTemplateNew = arCreateRSTemplate(false, false, false, 'dataFileName');
nTC = RSTemplateNew.nTC;
nDR = RSTemplateNew.nDR;


% time-course data
for tc = 1:nTC
    m = 1;
    dLink = RSTemplateNew.timeCourse(tc).dLink;

    header = [{ar.model.t}, ar.model(m).data(dLink).y];
    data = [ar.model(m).data(dLink).tExp, ar.model(m).data(dLink).yExpRaw];
    data = num2cell(sortrows(data));
    
    filePath = fullfile('Data', sprintf('%s_TC%03d.csv', projectName, tc));    
    writecell([header; data], filePath);
end

% dose-response data
for dr = 1:nDR
    m = 1;
    dLink = RSTemplateNew.doseResponse(dr).dLink;

    tVar = {ar.model.t};
    respVar = {RSTemplateNew.doseResponse(dr).response_parameter};
    obs = ar.model(m).data(dLink(1)).y;
    header = [tVar, respVar, obs];
    
    data = [];
    for id = 1:length(dLink)
        d = dLink(id);
        
        % synthetic time and observable values
        tExp = ar.model(m).data(d).tExp;
        yExpRaw = ar.model(m).data(d).yExpRaw;
        
        % response variable values
        respVal = RSTemplateNew.doseResponse(dr).values(id);
        respVals = repmat(respVal, size(tExp));
        
        % append to table
        rows = [tExp, respVals, yExpRaw];
        data = [data; rows];
    end

    data = num2cell(sortrows(data));    
    filePath = fullfile('Data', sprintf('%s_DR%03d.csv', projectName, dr));
    writecell([header; data], filePath);

end


arLink();

end
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
        if isfield(ar.model(m).data(d), 'tT')
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
    end
end


%% save the data as xls files
for m = 1:length(ar.model)
    for d = 1:length(ar.model(m).data)
        header = ['t', ar.model(m).data(d).y];
        data = num2cell([ar.model(m).data(d).tExp, ar.model(m).data(d).yExp]);
        filePath = fullfile('Data', sprintf('%s_M%d_C%d.xls', projectName, m, d));
        % there are some encoding problems when running simulations on the IMBI cluster (Linux)
        % therefore, go back to the old xlswrite function
        % writecell([header; data], filePath);
        xlswrite(filePath, [header; data]);
    end
end

arLink();

end
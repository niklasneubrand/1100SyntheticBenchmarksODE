function obsStruct = arUpdateObsParams(m, obsStruct)

global ar

% simulate the model at new time points
[simuSuccess, configSuccess, errReport] = arSimuMultiTries(true, false, true);
if simuSuccess
    % replace the previous configs by the successful configs
    configs = fieldnames(configSuccess);
    for i = 1:length(configs)
        ar.config.(configs{i}) = configSuccess.(configs{i});
    end
else
    error('arSimuMultiTries failed: %s.', errReport)
end
       

% get the number of observables and conditions
RSTemplateNew = arCreateRSTemplate(false, false, false);
nTC = RSTemplateNew.nTC;
nDR = RSTemplateNew.nDR;
nExp = nTC + nDR;
nObsTotal = size(obsStruct.stdObsRaw, 2);

% save the old values for comparison
obsStruct.obsMeanOld = obsStruct.obsMean;
obsStruct.stdObsOld = obsStruct.stdObs;

% reset stdObs to the raw values
% obsStruct.stdObs = obsStruct.stdObsRaw;


%% get the data
ySimuAll = cell(1, nTC + nDR);
for tc = 1:nTC
    ySimuAll{tc} = ar.model(m).data(tc).yExpSimu;
end
for dr = 1:nDR
    d = RSTemplateNew.doseResponse(dr).dLink;
    ySimuAll{nTC + dr} = vertcat(ar.model(m).data(d).yExpSimu);
end

%% update the mean magnitudes
for ex = 1:nExp
    ySimu = ySimuAll{ex};
    for iCol = 1:nObsTotal
        if obsStruct.CondObsMatrix(ex, iCol)>0
            iObs = sum(0~=obsStruct.CondObsMatrix(ex, 1:iCol));
            traj = ySimu(:, iObs);
            if obsStruct.qLog(iCol)
                % traj is on log scale
                % -> calculate mean on lin scale and transform back
                meanMagnitude = log10(mean(10.^traj, 'omitnan'));
            else
                % calculate the mean and transform to log scale
                meanMagnitude = log10(mean(traj, 'omitnan'));
            end
            obsStruct.obsMean(ex, iCol) = meanMagnitude;
        end
    end
end

%% update the error parameters

% update values in obsStruct
qUpdateStd = false(size(obsStruct.stdObs));
qUpdateStd(:, ~obsStruct.qLog) = obsStruct.CondObsMatrix(:, ~obsStruct.qLog)>0;
qUpdateStd(:, ~obsStruct.qLog) = qUpdateStd(:, ~obsStruct.qLog) & isfinite(obsStruct.obsMean(:, ~obsStruct.qLog));
obsStruct.stdObs(qUpdateStd) = obsStruct.stdObsRaw(qUpdateStd) + obsStruct.obsMean(qUpdateStd);

% impose the minimum value
std_min = -0.5 * ar.config.add_c * log10(exp(1));
std_min = round(std_min + 2);  % add some margin (2 orders of magnitude)
obsStruct.stdObs(qUpdateStd) = max(obsStruct.stdObs(qUpdateStd), std_min, 'omitnan');

% update values in ar struct
for ex = 1:nExp
    for iObs = 1:nObsTotal
        if qUpdateStd(ex, iObs)
            pName = sprintf('sd%i_%s', obsStruct.paramIndices(ex, iObs), obsStruct.obsNames{iObs});
            val = obsStruct.stdObs(ex, iObs);
            lb = floor(val) - 2;
            ub = ceil(val) + 2;
            arSetPars(pName, val, 1, 1, lb, ub);
        end
    end
end


%% update the offset parameters

% update values in obsStruct
obsStruct.offsetValOld = obsStruct.offsetVal;
obsStruct.offsetVal = nan(nExp, nObsTotal);
obsStruct.offsetVal(:, obsStruct.idOffset) = floor(obsStruct.obsMean(:, obsStruct.idOffset)-2);

% update values in ar struct
for ex = 1:nExp
    for iObs = 1:nObsTotal
        if obsStruct.CondObsMatrix(ex, iObs)>0 && ismember(iObs, obsStruct.idOffset)
            pName = sprintf('offset%i_%s', obsStruct.paramIndices(ex, iObs), obsStruct.obsNames{iObs});
            val = obsStruct.offsetVal(ex, iObs);
            lb = floor(val) - 2;
            ub = ceil(val) + 2;
            arSetPars(pName, val, 1, 1, lb, ub);
        end
    end
end

%% sort the fields
obsStruct = sortStruct(obsStruct);

end
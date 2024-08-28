function obsStruct = arUpdateObsParams(m, obsStruct)

global ar

% simulate the model at new time points
arSimu(false, false, true)

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
                % traj already on log scale, directly calculate the mean
                meanMagnitude = mean(traj, 'omitnan');
            else
                % transform to log scale and calculate the mean
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

% pdate values in ar struct
for ex = 1:nExp
    for iObs = 1:nObsTotal
        if ismember(iObs, obsStruct.idOffset)
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
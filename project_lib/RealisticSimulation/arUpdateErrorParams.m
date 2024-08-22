function obsStruct = arUpdateErrorParams(m, obsStruct)

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


% get the data
ySimuAll = cell(1, nTC + nDR);
for tc = 1:nTC
    ySimuAll{tc} = ar.model(m).data(tc).yExpSimu;
end
for dr = 1:nDR
    d = RSTemplateNew.doseResponse(dr).dLink;
    ySimuAll{nTC + dr} = vertcat(ar.model(m).data(d).yExpSimu);
end

% recalculate the meanMagnitudes
for ex = 1:nExp
    ySimu = ySimuAll{ex};
    for iCol = 1:nObsTotal
        if obsStruct.CondObsMatrix(ex, iCol)>0 && ~obsStruct.idLog(iCol)
            iObs = sum(0~=obsStruct.CondObsMatrix(ex, 1:iCol));
            traj = ySimu(:, iObs);
            meanMagnitude = log10(mean(traj, 'omitnan'));
            obsStruct.obsMean(ex, iCol) = meanMagnitude;
            if isfinite(meanMagnitude)
                % only possible if meanMagnitude is not NaN or Inf
                % this would be the case if the observable is always zero or negative
                obsStruct.stdObs(ex, iCol) = obsStruct.stdObsRaw(ex, iCol) + meanMagnitude;
            end

            % also update the paramter in the ar struct
            pName = sprintf('sd%i_%s', obsStruct.paramIndices(ex, iCol), obsStruct.obsNames{iCol});
            val = obsStruct.stdObs(ex, iCol);
            lb = floor(val) - 2;
            ub = ceil(val) + 2;
            arSetPars(pName, val, 1, 1, lb, ub);
        end
    end
end


end
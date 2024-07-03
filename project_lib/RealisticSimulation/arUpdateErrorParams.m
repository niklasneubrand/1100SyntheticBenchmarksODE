function obsStruct = arUpdateErrorParams(m, obsStruct)

global ar

% simulate the model at new time points
arSimu(false, false, true)

% get the number of observables and conditions
nConds = size(obsStruct.stdObsRaw, 1);
nObs = size(obsStruct.stdObsRaw, 2);

% save the old values for comparison
obsStruct.obsMeanOld = obsStruct.obsMean;
obsStruct.stdObsOld = obsStruct.stdObs;

% reset stdObs to the raw values
obsStruct.stdObs = obsStruct.stdObsRaw;

% recalculate the meanMagnitudes
for c = 1:nConds
    % for realistic simlations condition index c can be used in ar.data
    for iObs = 1:nObs
        if isfinite(obsStruct.CondObsMatrix(c, iObs)) && ~obsStruct.idLog(iObs)
            traj = ar.model(m).data(c).yExpSimu(:, iObs);
            meanMagnitude = log10(mean(traj, 'omitnan'));
            obsStruct.obsMean(c, iObs) = meanMagnitude;
            if isfinite(meanMagnitude)
                % only possible if meanMagnitude is not NaN or Inf
                % this would be the case if the observable is always zero or negative
                obsStruct.stdObs(c, iObs) = obsStruct.stdObs(c, iObs) + meanMagnitude;
            end

            % we have to introduce a minimum value for the std
            % otherwise arCalcSimu throws an error
            % the condition is: 0 >! 2*log(ystd) + ar.config.add_c ==> ystd > exp(-ar.config.add_c/2)
            minStd = exp(-ar.config.add_c/2);
            orderOfMag = floor(log10(minStd));
            % round the significand upwards
            minStd = ceil(minStd/10^orderOfMag)*10^orderOfMag;
            obsStruct.stdObs(c, iObs) = max(obsStruct.stdObs(c, iObs), minStd);
        end
    end
end


end
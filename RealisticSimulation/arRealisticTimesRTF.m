function arRealisticTimesRTF(randomSeed)

arguments
    randomSeed (1,:) = 'shuffle'
end

global ar

% model dynamics are needed for RTF fits
arSimu(false, true, true);

for m=1:length(ar.model)
    for d=1:length(ar.model(m).data)

        % Convert orders of magnitude (not sure why)
        timeRescaleFactors = arMagnitudeConversion(m, d);

        % Fit Transient Function
        % arTransientFit overwrites ar -> save a copy of ar
        % this could be optimized by reducing the number of times the
        % global ar struct is copied and exchanged. But not a priority.
        arBackup = arDeepCopy(ar);
        transPars = arTransientPars(m, d);
        ar = arDeepCopy(arBackup);

        % Set Time Points
        arSetTimePoints(transPars, m, d, timeRescaleFactors, randomSeed);
    end
end

end
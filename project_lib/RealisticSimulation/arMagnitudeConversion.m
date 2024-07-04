function convertt = arMagnitudeConversion(m, d, minPoints, minPointFraction)

% Magnitude_Conversion.m:
%   Switch order of magnitude of time in range 0-1000
%   (if range condition allows, set dtmin > 1)

%   Switch order of magnitude of data in Range >10^-3
%   or <-10^-3 (if negative sign)

arguments
    m (1,1) double {mustBeInteger,mustBePositive} = 1
    d (1,1) double {mustBeInteger,mustBePositive} = 1
    minPoints (1,1) double {mustBeInteger,mustBePositive} = 100
    minPointFraction (1,1) double {mustBeNumeric} = 0.1
end

global ar

%% rescale y values
y = ar.model(m).data(d).yFineSimu;
converty = ones(1, size(y, 2));
for iObs=1:size(y, 2)
    if (max(y(:, iObs)) > 10^(4) || max(y(:, iObs)) < 10^(-4))
        converty(iObs) = 10.^(floor(log10(range(y(:, iObs)))));
        y(:, iObs) = y(:, iObs)./converty(iObs);
    end
end
ar.model(m).data(d).yFineSimu = y;

%% rescale t values

% 1. delete points of steady-state tail
%    but keep at least minPoints points
minPoints = max(minPoints, minPointFraction*ar.config.nFinePoints);
t = repmat(ar.model(m).data(d).tFine, 1, size(y, 2));
convertt = ones(1, size(y, 2));
for iObs=1:size(y, 2)
    for jT=size(y, 1)-1:-1:minPoints
        if abs(y(jT+1, iObs) - y(jT-1, iObs))/max(y(:, iObs)) < 10^(-3)
            y(jT+1, iObs) = nan;
            t(jT+1, iObs) = nan;
        else
            break
        end
    end

    % Rescale maximum time value to be beween 10 and 100
    tMax = max(t(:, iObs), [], 'omitnan');
    if tMax < 10 || tMax > 100
        convertt(iObs) = round(100/tMax, 1, 'significant');
    end
    t(:, iObs) = t(:, iObs) .* convertt(iObs);
end

% Attention:
% before rescaling tFine is shared between al observables (size nTimes x 1)
% after rescaling tFine is differet for all observables (size nTimes x nObs) 
ar.model(m).data(d).tFine = t;

end


function convertt = arMagnitudeConversion(m, d)

% Magnitude_Conversion.m:
%   Switch order of magnitude of time in range 0-1000
%   (if range condition allows, set dtmin > 1)

%   Switch order of magnitude of data in Range >10^-3
%   or <-10^-3 (if negative sign)

arguments
    m (1,1) double {mustBeInteger,mustBePositive} = 1
    d (1,1) double {mustBeInteger,mustBePositive} = 1
end

global ar

tFine = ar.model(m).data(d).tFine;
y = ar.model(m).data(d).yFineSimu;

converty = ones(size(y,2),1);
for i=1:size(y,2)
    if (max(y(:,i)) > 10^(4) || max(y(:,i)) < 10^(-4))
        converty(i) = 10.^(floor(log10(range(y(:,i)))));
        y(:,i) = y(:,i)./converty(i);
    end
end

% Set overall tRange to values between 10 and 100
tMax = max(tFine);
factor = 1;
if tMax < 10 || tMax > 100
    factor = round(100/tMax, 1, 'significant');
end
convertt = factor*ones(size(y, 2), 1);

ar.model(m).data(d).tFine = tFine*convertt(1);
ar.model(m).data(d).yFineSimu = y;

end


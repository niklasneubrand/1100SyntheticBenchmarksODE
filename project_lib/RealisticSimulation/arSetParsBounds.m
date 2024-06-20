
function arSetParsBounds(range)
% ARSETPASBOUNDS Set upper and lower bounds for parameters
%
% The bounds are set symetrically on the log10 scale:
%   [p*10^(-range), p*10^(+range)]
% If p=0, the bounds are set symetrically on the linear scale:
%   [-range, +range]

arguments
    range (1,1) double = 2
end

global ar

for i = 1:length(ar.p)
    if ar.qLog10(i)
        ar.lb(i) = ar.p(i)-range;
        ar.ub(i) = ar.p(i)+range;
    elseif ar.p(i) > 0
        ar.lb(i) = ar.p(i)*10^(-range);
        ar.ub(i) = ar.p(i)*10^(+range);
    elseif ar.p(i) < 0
        ar.lb(i) = ar.p(i)*10^(+range);
        ar.ub(i) = ar.p(i)*10^(-range);
    else % if ar.p == 0 und qLog10 == 0
        ar.lb(i) = -range;
        ar.ub(i) = +range;
    end
end

% round to nearest integers
ar.lb = floor(ar.lb);
ar.ub = ceil(ar.ub);

arFprintf(2,'Parameter bounds updated realistically.\n');
    
end
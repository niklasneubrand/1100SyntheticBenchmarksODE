
function arSetParsBounds(range)
% ARSETPARSBOUNDS Set upper and lower bounds for parameters
%
% The bounds are set symetrically on the log10 scale:
%   [p*10^(-range), p*10^(+range)]
% If p=0, the bounds are set symetrically on the linear scale:
%   [-range, +range]

arguments
    range (1,:) double = 2
end

global ar

nParams = length(ar.p);
nRange = length(range);

if nRange == 1
    range = repmat(range, 1, nParams);
elseif nRange ~= nParams
    error('range must be scalar of array of size 1xlength(ar.p).')
end

for i = 1:nParams
    if ar.qLog10(i)
        ar.lb(i) = ar.p(i)-range(i);
        ar.ub(i) = ar.p(i)+range(i);
    elseif ar.p(i) > 0
        ar.lb(i) = ar.p(i)*10^(-range(i));
        ar.ub(i) = ar.p(i)*10^(+range(i));
    elseif ar.p(i) < 0
        ar.lb(i) = ar.p(i)*10^(+range(i));
        ar.ub(i) = ar.p(i)*10^(-range(i));
    else % if ar.p == 0 und qLog10 == 0
        ar.lb(i) = -range(i);
        ar.ub(i) = +range(i);
    end
end

% round to nearest integers
ar.lb = floor(ar.lb);
ar.ub = ceil(ar.ub);
    
end
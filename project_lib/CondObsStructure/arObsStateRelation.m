function [nStates, states] = arObsStateRelation(fy, xLabel, z, fz)
% AROBSERVABLESTATERELATION Determine state dependencies of observables
%
%  Inputs:
%   fy      (1, :) cell     strings with symbolic expressions for observables.
%                           e.g. ar.model.data.fy
%   xLabel  (1, :) cell     strings with symbolic expressions for states.
%                           e.g. ar.model.data.xLabel
%   z       (1, :) cell     strings with symbolic expressions for derived
%                           variables. e.g. ar.model.data.z
%                           default: {}
%   fz      (1, :) cell     strings with symbolic expressions for derived
%                           variables. e.g. ar.model.data.fz
%                           default: {}
%
%  Outputs:
%   nStates (1, :) double   number of state dependencies for each observable
%   states  (1, :) cell     state names each observable depends on
%
%  See also AROBSERVABLEPARAMRELATION, ARSYM, ARCONDOBSSTATS, ARMODELOBSSTATS


% input validation
arguments
    fy (1, :) cell
    xLabel (1, :) cell
    z (1, :) cell = {}
    fz (1, :) cell = {}
end

% intialize variables
nObs = length(fy);
nStates = zeros(1, nObs);
states = cell(1, nObs);

% if no states given, return zero/empty cells
if isempty(xLabel)
    return
end

%% symbolic calculations

% convert to symbolic variables
fySym = arSym(fy);
xSym = arSym(xLabel);
zSym = arSym(z);
fzSym = arSym(fz);

% substitute derived variables z with their state dependencies
fySym = subs(fySym, zSym, fzSym);

% calculate jacobian matrix
% partical derivatives of observables with respect to states
% dydx(i, j) = dy(i)/dx(j); nObs x nStates matrix 
dydx = jacobian(fySym, xSym);


%% determine state dependencies and number of state dependencies
isDependent = logical(dydx ~= 0);
for iObs=1:nObs
    states(iObs) = {xLabel(isDependent(iObs, :))};
    nStates(iObs) = sum(isDependent(iObs, :));
end


end
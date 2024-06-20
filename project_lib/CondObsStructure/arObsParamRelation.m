function [nPars, offset, scale, dependent] = arObsParamRelation(fy, pLabel, z, fz)
% AROBSERVABLEPARAMRELATION  Determine parameter dependencies of observables
%
%  Inputs:
%   fy      (1, :) cell     strings with symbolic expressions for observables.
%                           e.g. ar.model.data.fy
%   pLabel  (1, :) cell     strings with parameter names.
%                           e.g. ar.model.param.pLabel
%   z       (1, :) cell     strings with symbolic expressions for derived
%                           variables. e.g. ar.model.data.z
%                           default: {}
%   fz      (1, :) cell     strings with symbolic expressions for state
%                           dependencies of derived variables.
%                           e.g. ar.model.data.fz
%                           default: {}
%
%  Outputs:
%   nPars   (1, :) double   number of parameters in each observable
%   offset  (1, :) cell     name(s) of offset param(s) for each observable
%   scale   (1, :) cell     name(s) of scale param(s) for each observable
%   dependet (1, :) cell    name(s) of all param(s) appearing in each observable
%
%  See also AROBSSTATERELATION, ARSYM, ARCONDOBSSTATS, ARMODELOBSSTATS


%% input validation
arguments
    fy (1, :) cell
    pLabel (1, :) cell
    z (1, :) cell = {}
    fz (1, :) cell = {}
end

% initialize variables
nObs = length(fy);
nPars = zeros(1, nObs);
offset = cell(1, nObs);
scale = cell(1, nObs);
dependent = cell(1, nObs);

% if no parameters given, return zero/empty cells
if isempty(pLabel)
    return
end

%% symbolic calculations

% convert to symbolic variables
fySym = arSym(fy);
pSym = arSym(pLabel);
zSym = arSym(z);
fzSym = arSym(fz);

% substitute derived variables z with their state dependencies
fySym = subs(fySym, zSym, fzSym);

% calculate jacobian matrix
% partical derivatives of observables with respect to parameters
% dydp(i, j) = dy(i)/dp(j); nObs x nPars matrix
dydp = jacobian(fySym, pSym);


%% determine (number of) parameter dependencies
isDependent = logical(dydp ~= 0);
for iObs=1:nObs
    nPars(iObs) = sum(isDependent(iObs, :));
    dependent{iObs} = pLabel(isDependent(iObs, :));
end


%% determine offset parameters
% offset parameters satisfy dy/dp = 1.
% we use this identity to find them
isOffset = logical(dydp == 1);
for iObs=1:nObs
    if any(isOffset(iObs, :) == 1)
        offset(iObs) = pLabel(isOffset(iObs, :));
    else
        offset(iObs) = {''};
    end
end


%% determine scale parameters
% linear scale parameters satisfy: dy/dp = (y-offset)/pLabel.
% we use this identity to find them

% first replace offset parameters with 0 in in fy string
fySym0 = fySym;
for iObs=1:nObs
    if ~isempty(offset{iObs})
        fySym0(iObs) = arSubs(fySym0(iObs), ...
                              arSym(offset(iObs)), ...
                              arSym('0'));
    end
end

% then find scale parameters and get their names
isScale = logical(dydp == fySym0.'./pSym);
for iObs=1:nObs
    if any(isScale(iObs, :) == 1)
        scale(iObs) = pLabel(isScale(iObs, :));
    else
        scale(iObs) = {''};
    end
end

end
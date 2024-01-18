function [iMainCond, exitFlag] = arFindMainCondition(iModel, qFit, qSimu)
% arFindWtCondition  Finds the most relevent condition in ar.model
%
%   Inputs:
%    iModel     Index of the model to be used
%    qFit       Logical indicating if the model should be fitted
%    qSimu      Logical indicating if the model should be simulated
%
%   Outputs:
%    iMainCond  Index of the most relevent condition in ar.model
%    exitFlag   String indicating the reason for the choice of iMainCond
%
%   The function searches the most relevant condition in ar.model
%   by a hirarchy of criteria. This means the next criterium is only
%   applied to those conditions that rank best in the previous criteria.

%   The criteria are:
%    0. Only one condition exists
%    1. Fewest replacements (closest to wild type condition)
%    2. Most dynamic states (condition does not disable large parts of the model)
%    3. Most observables (condition has most experiments)
%    4. Most data points (condition has most data points)
%    5. First condition of remaining the subset
%


arguments
    iModel (1,1) double {mustBeInteger, mustBePositive} = 1
    qFit (1,1) logical = false
    qSimu (1,1) logical = true
end

% load the model
global ar  %#ok<*GVMIS>
if qFit
    arFit();  % fit the model -> best parameters
end
if qSimu
    arSimu(false, true, true);  % simulate -> dynamics available
end

% check if model has multiple conditions
nConds = length(ar.model(iModel).condition);
if nConds == 1
    iMainCond = 1;
    exitFlag = 'singleCondition';
    return
end

% find conditions with fewest replacements (closest to WT)
condStruct = arModelConditions(iModel);
nRepl = cellfun(@length, condStruct.condReplace);
shortConds = find(nRepl == min(nRepl));
if length(shortConds)==1
    iMainCond = shortConds;
    exitFlag = 'fewestReplacements';
    return
end

% find conditions with most dynamic states
nDynamicStates = zeros(1, nConds);
for iCond = shortConds
    qDynamicState = arCondDynamicStates(iModel, iCond, false, false);
    nDynamicStates(iCond) = sum(qDynamicState);
end
maxDynStatesCond = find(nDynamicStates == max(nDynamicStates));
if length(maxDynStatesCond) == 1
    iMainCond = maxDynStatesCond;
    exitFlag = 'mostDynamicStates';
    return
end

% find conditions with most observables
nObs = zeros(1, nConds);
for iCond = maxDynStatesCond
    nObs(iCond) = length(vertcat(ar.model.data(ar.model.condition(iCond).dLink).fy));
end
maxObsCond = find(nObs == max(nObs));
if length(maxObsCond) == 1
    iMainCond = maxObsCond;
    exitFlag = 'mostObservables';
    return
end

% find condition with most data points
nData = zeros(1, nConds);
for iCond = maxObsCond
    nData(iCond) = numel(ar.model.data(ar.model.condition(iCond).dLink).yExp);
end
maxDataCond = find(nData == max(nData));
if length(maxDataCond) == 1
    iMainCond = maxDataCond;
    exitFlag = 'mostDataPoints';
else
    % give up and take the first condition of the remaining subset
    iMainCond = maxDataCond(1);
    exitFlag = 'firstRemaining';
end

end
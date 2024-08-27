function mainCondTab = arFindMainConditionNew(m, qFit, qSimu)
% arFindMainCondition  Finds the most relevent condition in ar.model
%
%   Inputs:
%    m     Index of the model to be used
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
    m (1,1) double {mustBeInteger, mustBePositive} = 1
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

mainCondStruct = struct();
mainCondStruct.modelName = string(ar.info.name);

nConds = length(ar.model(m).condition);

% check if model has multiple conditions
if nConds == 1
    mainCondStruct.singleCond = true;
else
    mainCondStruct.singleCond = false;
end

% find conditions with fewest replacements (closest to WT)
condStruct = arModelConditions(m);
nRepl = cellfun(@length, condStruct.condReplace);
shortConds = find(nRepl == min(nRepl));
mainCondStruct.fewestReplacements = {shortConds};

% find conditions with most dynamic states
nDynamicStates = zeros(1, nConds);
for c = 1:nConds
    qDynamicState = arCondDynamicStates(m, c);
    nDynamicStates(c) = sum(qDynamicState);
end
maxDynStatesCond = find(nDynamicStates == max(nDynamicStates));
mainCondStruct.mostDynamicStates = {maxDynStatesCond};

% find conditions with most observables
nObs = zeros(1, nConds);
for c = 1:nConds
    nObs(c) = length(vertcat(ar.model(m).data(ar.model(m).condition(c).dLink).fy));
end
maxObsCond = find(nObs == max(nObs));
mainCondStruct.mostObservables = {maxObsCond};

% find condition with most data points
nData = zeros(1, nConds);
for c = 1:nConds
    nData(c) = sum([ar.model(m).data(ar.model(m).condition(c).dLink).ndata]);
end
maxDataCond = find(nData == max(nData));
mainCondStruct.mostDataPoints = {maxDataCond};

mainCondTab = struct2table(mainCondStruct, "AsArray", true);


end
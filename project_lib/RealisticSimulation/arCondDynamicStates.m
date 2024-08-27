function qDynamicState = arCondDynamicStates(m, conds, qSimu, dynTol)
% arCondDynamicStates  Checks which states show dynamics in a model condition.
%
%  Inputs:
%   m       index of the model in the ar struct
%   c       index of in ar.model.condition
%   qSimu   logical flag to simulate the model before checking the dynamics
%   dynTol  tolerance for the dynamics check
%
%  Outputs:
%   qDynamicState   logical vector of length nStates, indicating which
%                   states show dynamics
%
%  See also arFit, arSimu, arFindMainCondition


arguments
    m (1,1) double {mustBeInteger, mustBePositive} = 1
    conds (1,1) = "all"
    qSimu (1,1) logical = false
    dynTol (1,1) double {mustBePositive} = 1e-8
end

% load the model
global ar  %#ok<*GVMIS>

% simulate the model to get the dynamics
if qSimu
    try
        arSimu(false, true, true)
    catch ME
        msgText = getReport(ME, "extended", "hyperlinks", "on");
        warning('Error in arSimu: %s', msgText)
    end
end

% set the condition index
if ~isnumeric(conds) && strcmp(conds, "all")
    conds = 1:length(ar.model(m).condition);
end
nStates = length(ar.model(m).x);
nConds = length(conds);

% check the dynamics
qDynamicState = false(nConds, nStates);
for ic = 1:nConds
    c = conds(ic);
    xFineSimu = ar.model(m).condition(c).xFineSimu;
    for iState = 1:nStates
        dataRange = range(xFineSimu(:, iState));  % range of simulated dynamics
        normedDataRange = dataRange/max(xFineSimu(:, iState));  % normalized range
        qDynamicState(ic, iState) = (abs(dataRange) > dynTol);
        qDynamicState(ic, iState) = qDynamicState(ic, iState) && (abs(normedDataRange) > dynTol);
        qDynamicState(ic, iState) = qDynamicState(ic, iState) && isfinite(normedDataRange);
    end
end
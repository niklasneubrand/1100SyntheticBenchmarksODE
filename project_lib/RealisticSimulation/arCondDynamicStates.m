function qDynamicState = arCondDynamicStates(iModel, iCond, qFit, dynTol)
% arCondDynamicStates  Checks which states show dynamics in a model condition.
%
%  Inputs:
%   iModel      index of the model in the ar struct
%   iCond       index of in ar.model.condition
%   qFit        flag: should the model be fitted before the check?
%   dynTol      tolerance for the dynamics check
%
%  Outputs:
%   qDynamicState   logical vector of length nStates, indicating which
%                   states show dynamics
%
%  See also arFit, arSimu, arFindMainCondition


arguments
    iModel (1,1) double {mustBeInteger, mustBePositive} = 1
    iCond (1,1) double {mustBeInteger, mustBePositive} = 1
    qFit (1,1) logical = false
    dynTol (1,1) double {mustBePositive} = 1e-8
end

% load the model
global ar  %#ok<*GVMIS>
if qFit
    arFit();  % fit the model -> best parameters
end
% simulate the model to get the dynamics
try
    arSimu(false, true, true);
catch
    try
        arSimu(false, false, true)
    catch ME
        msgText = getReport(ME, "extended", "hyperlinks", "on");
        warning('Error in arSimu: %s', msgText)
    end
end

% check the dynamics
xFineSimu = ar.model(iModel).condition(iCond).xFineSimu;
nStates = size(xFineSimu, 2);
qDynamicState = false(1, nStates);
for iState = 1:nStates
    dataRange = range(xFineSimu(:, iState));  % range of simulated dynamics
    normedDataRange = dataRange/max(xFineSimu(:, iState));  % normalized range
    qDynamicState(iState) = (abs(dataRange) > dynTol);
    qDynamicState(iState) = qDynamicState(iState) && (abs(normedDataRange) > dynTol);
    qDynamicState(iState) = qDynamicState(iState) && isfinite(normedDataRange);
end

end
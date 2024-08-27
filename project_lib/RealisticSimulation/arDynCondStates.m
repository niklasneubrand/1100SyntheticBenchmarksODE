function [qDynamicCurves, ratioDynCurves] = arDynCondStates(m, RSTemplate, qSimu, dynTol)
% arDynCondStates  Check which curves show dynamics in a model condition.
%
%  Inputs:
%   m           index of the model in the ar struct
%   RSTemplate  struct with information about TC and DR experiments (see arCreateRSTemplate)
%   qSimu       logical flag to simulate the model before checking the dynamics
%   dynTol      tolerance for the dynamics check
%
%  Outputs:
%   qDynamicCurves  logical matrix of size nExperiments x nStates, indicating which
%                   curves show dynamics
%   ratioDynCurves  vector of length nStates, indicating the ratio of dynamic curves
%
%  Notes:
%   The function checks the dynamics of the states (X) in the different experiments.
%   The term experiment in this context refers to a time course condition (TC)
%   or a set of conditions that form a dose response curve (DR).

arguments
    m (1,1) double {mustBeInteger, mustBePositive} = 1
    RSTemplate (1,1) struct = arCreateRSTemplate(true, false, false)
    qSimu (1,1) logical = false
    dynTol (1,1) double {mustBePositive} = 1e-8
end

global ar

%% simulate the model to get the dynamics
if qSimu
    try
        arSimu(false, true, true)   % fine dynamics for time courses
        arSimu(false, false, true)  % tExp for dose responses curves
    catch ME
        msgText = getReport(ME, "extended", "hyperlinks", "on");
        warning('Error in arSimu: %s', msgText)
    end
end

%% collect the state curves predicted by the model for each experiment

curvesAll = cell(1, RSTemplate.nExp);
% time course data (simulated time response)
for tc = 1:RSTemplate.nTC
    curvesAll{tc} = ar.model(m).condition(RSTemplate.timeCourse(tc).cLink).xFineSimu;
end

% dose response data (simulated dose response)
for dr = 1:RSTemplate.nDR
    doseCurve = [];
    cLink = RSTemplate.doseResponse(dr).cLink;
    for ic = 1:length(cLink)
        c = cLink(ic);
        tIdx = find(RSTemplate.doseResponse(dr).tExp==ar.model.condition(c).tExp);
        doseCurve = vertcat(doseCurve, ar.model(m).condition(c).xExpSimu(tIdx, :));
    end
    curvesAll{RSTemplate.nTC + dr} = doseCurve;
end


%% check the dynamics of the curves
qDynamicCurves = cellfun(@(x) checkCurveDynamics(x, dynTol), curvesAll, 'UniformOutput', false);
qDynamicCurves = vertcat(qDynamicCurves{:});
ratioDynCurves = mean(qDynamicCurves, 1);

end


function qDynamic = checkCurveDynamics(trajectories, rtol)
% checkCurveDynamics  Check if a curve shows dynamics.
%
%  Inputs:
%   trajectories    matrix of size nPoints x nCurves
%   rtol            relative tolerance for the dynamics check
%
%  Outputs:
%   qDynamic        logical vector of length nCurves, indicating which
%                   curves show dynamics
%
%  Method:
%    Compare change of curve (normalized by max value) to the tolerance value.
%
%  Note:
%    This method is not robust for noisy or divergent (with Infs) trajectories.
%    It is intended for smooth and well-behaved trajectories.
%    We apply the function only to simulated trajectores. So it should be fine.

relRange = range(trajectories)./max(trajectories);
qDynamic = (relRange > rtol);

end



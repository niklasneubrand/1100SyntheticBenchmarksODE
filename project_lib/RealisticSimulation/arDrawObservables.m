function obsStruct = arDrawObservables(m, options, RSTemplate)
%OBSERVABLES Define Observables
%   Detailed explanation goes here

arguments
    m (1,1) double {mustBeInteger, mustBePositive} = 1
    options (1,1) struct = struct()
    RSTemplate (1,1) struct = arCreateRSTemplate()
end

%% initialize d2d and RS options
global ar  %#ok<*GVMIS>
options = arSetDefaultRSOptions(options);
rng(options.rngSeed);

%% Simulate the model to get the dynamics
try
    arSimu(true, true, true);  % fine points
    arSimu(true, false, true); % experimental
catch ME
    msgText = getReport(ME, "extended", "hyperlinks", "on");
    warning('Error in arSimu: %s', msgText)
end

%% Decide which states to include (remove states that are constant in too many conditions)
[qDynamicStates, ratioDynStates] = arDynCondStates(1, RSTemplate, 1);  % for each state, ration of experiments with dynamics
qInclState = ratioDynStates >= options.inclDynRatio;  % include states with sufficient ratio of dynamic conditions
inclStates = ar.model(m).x(qInclState);  % names of included states
nInclStates = length(inclStates);  % number of included states
nInclDynStatesMean = mean(sum(qDynamicStates(:, qInclState), 2));  % mean number of included, dynamic states per experiment

if nInclStates == 0
    error('Only constant species found, no dynamics.')
elseif nInclStates < 5
    warning('Only found %d dynamic species. A minimum of 5 is required.', nInclStates)
end

%% Draw observables for main condition
% load the table with the statistical information about the observables
load(fullfile(fileparts(mfilename('fullpath')), 'ObservableDraw.mat'), 'obs');

% Draw number of all observables
randRow = randi(length(obs.obs));               % random row in obs table
nObs = round(obs.obs(randRow)*nInclDynStatesMean);  % corresp. number of observables
nObs = min(nObs, nInclStates);                  % upper bound for nObs
nObs = max(nObs, 1);                            % lower bound for nObs

% draw number of compounds and directly observed variables
randRow = randi(length(obs.comp));              % random row in obs table
nComp = round(obs.comp(randRow)*nObs);          % corresp. number of compounds
nComp = min(nComp, nObs);                       % upper bound for nComp
compSize = round(obs.compadd(randRow));         % corresp. size of compounds
compSize = min(compSize, nInclStates);          % upper bound
compSize = max(compSize, 2);                    % lower bound
% the number of unique compounds is limited to the possible number of combinations
nComp = min(nComp, nchoosek(nInclStates, compSize)); % upper bound for nComp
idComp = [];                                    % initialize compound indices
nDirect = nObs - nComp;                                 % number of directly observed variables
idDirect = sort(randperm(nInclStates, nDirect));        % indices for directly observed states
idUnobservedState = setdiff(1:nInclStates, idDirect);   % indices for unobserved states

% Draw the compound composition
% In this implementation all compounds have the same length. Could be improved.
if nComp > 0
    % create idComp, a matrix where each row represents a compound.
    % The matrix entries are state indices.
    [~, idComp] = sort(rand(nComp, nInclStates), 2); % nComp many permutations of state indices
    idComp = idComp(:, 1:compSize); % only keep the first compSize indices
    idComp = unique(sort(idComp, 2), 'rows'); % remove possible duplicate compounds
    while size(idComp, 1) < nComp
        % if not enough compounds (i.e. there were duplicates): draw again
        [~, idComp2] = sort(rand(nComp, nInclStates), 2);
        idComp2 = idComp2(:, 1:compSize);
        idComp = unique([idComp; sort(idComp2, 2)], 'rows');
    end
    if size(idComp, 1) > nComp
        % if too many compounds, randomly select a subset of size nComp
        idComp = idComp(randperm(size(idComp, 1), nComp), :);
    end
end

% Draw ratio of variables on log scale
if options.qLogObs
    randRow = randi(length(obs.logobs));  % random row in obs table
    pLog = obs.logobs(randRow);  % corresp. percentage of log observables
else
    pLog = 0;
end

% Draw how many variables have scale and offset
if pLog > 0.5
    % over 50% of observables are on log scale
    % -> draw number of scale, offset and init as if all were on log scale
    nScale = round(obs.scalog(randi(length(obs.scalog)))*nObs);
    nOffset = round(obs.offlogrel(randi(length(obs.offlogrel)))*nScale);
else
    % less than 50% of observables are on log scale
    % -> draw number of scale, offset and init as if all were on non-log scale
    nScale = round(obs.scanonlog(randi(length(obs.scanonlog)))*nObs);
    nOffset = round(obs.offnonlogrel(randi(length(obs.offnonlogrel)))*nScale);
end

% get the simulated dynamics for the observables
nTC = RSTemplate.nTC;
nDR = RSTemplate.nDR;
nExp = nTC + nDR;
xSimuAll = cell(1, nExp);
ySimuAll = cell(1, nExp);

% time-courses
for tc = 1:nTC
    % Get the simulated data for the states
    c = RSTemplate.timeCourse(tc).cLink;
    xFineSimu = ar.model(m).condition(c).xFineSimu(:, qInclState);  % species trajectories
    xSimuAll{tc} = xFineSimu;
    % Get the simulated data for the drawn observables
    if nComp == 0
        % there are only directly observed states
        ySimuAll{tc} = xFineSimu(:, idDirect);
    else
        % there are also compounds
        compFineSimu = zeros(size(xFineSimu, 1), nComp);
        for iComp = 1:nComp
            compFineSimu(:, iComp) = sum(xFineSimu(:, idComp(iComp, :)), 2);
        end
        ySimuAll{tc} = [xFineSimu(:, idDirect) compFineSimu];
    end
end

% dose-responses
for dr = 1:nDR
    % a dose-response is linked to multiple conditions
    cLink = RSTemplate.doseResponse(dr).cLink;

    % Get the simulated data for the states (at the experimental time points)
    xExpSimu = [];
    for c = cLink
        tIdx = find(RSTemplate.doseResponse(dr).tExp==ar.model.condition(c).tExp);
        xExpSimu = [xExpSimu; ar.model(m).condition(c).xExpSimu(tIdx, qInclState)];
    end 
    xSimuAll{nTC + dr} = xExpSimu;
    % Get the simulated data for the drawn observables
    if nComp == 0
        % there are only directly observed states
        ySimuAll{nTC + dr} = xExpSimu(:, idDirect);
    else
        % there are also compounds
        compExpSimu = zeros(size(xExpSimu, 1), nComp);
        for iComp = 1:nComp
            compExpSimu(:, iComp) = sum(xExpSimu(:, idComp(iComp, :)), 2);
        end
        ySimuAll{nTC + dr} = [xExpSimu(:, idDirect) compExpSimu];
    end
end

%% Distribute observables to all conditions

% for each observable draw a roandom column with replacement
% from the condition-observable distribution matrix
CondObsMatrix = RSTemplate.condObsMatrix;
randomCols = randi(size(CondObsMatrix, 2), 1, nObs);
CondObsMatrix = CondObsMatrix(:, randomCols);

% check which observables show dynamics
dynTol = 1e-8;
qDynamicState = checkCurveDynamics(xSimuAll, dynTol);
qDynamicObs = checkCurveDynamics(ySimuAll, dynTol);


% remove constant observables (if desired)
switch options.replaceConstObs
    case 'no'
        % keep all observables, no replacements
        removeConstObs = false(size(condObsMatrix));
        addObs = zeros(size(condObsMatrix, 1));

    case 'minimal'
        % remove constant observables, add a random observable if necessary,
        % i.e. if all observables are constant for a experiment
        removeConstObs = CondObsMatrix & ~qDynamicObs;
        addObs = double(any(removeConstObs, 2));

    case 'all'
        % remove constant observables, add a new random observables
        % for each removed one
        removeConstObs = CondObsMatrix & ~qDynamicObs;
        addObs = sum(removeConstObs, 2);

    otherwise
        error('Unknown value for option replaceConstObs: %s', options.replaceConstObs)
end
CondObsMatrix(removeConstObs) = 0;

% check if observables have to be added (experiments without observables)
% need to be careful that replaced observables are not counted multiple times
addOneMore = addObs==0 & sum(CondObsMatrix, 2)==0;
addObs(addOneMore) = addObs(addOneMore) + 1;

% add new observables to the necessary experiments
if sum(addObs, "all") > 0
    for exp = 1:nExp
        for iObs = 1:addObs(exp)

            % logical vector for observables not yet included in this experiment
            expUnobservedObs = CondObsMatrix(exp, :)==0;

            if any(qDynamicObs(exp, expUnobservedObs))
                % at least one of the existing observable shows dynamics
                % -> use one of these observables
                iAdd = find(qDynamicObs(exp, expUnobservedObs));
                iAdd = iAdd(randi(length(iAdd)));
                idExpUnobserved = find(expUnobservedObs);
                iAdd = idExpUnobserved(iAdd);
                CondObsMatrix(exp, iAdd) = 1;
                
            elseif any(qDynamicState(exp, idUnobservedState))
                % at least one unobserved state shows dynamics
                % -> use one of these states as observable
                iAdd = find(qDynamicState(exp, idUnobservedState));
                iAdd = iAdd(randi(length(iAdd)));
                iAdd = idUnobservedState(iAdd);

                % update indices
                nObs = nObs + 1;
                nDirect = nDirect + 1;
                idDirect = [idDirect, iAdd];
                idUnobservedState = setdiff(idUnobservedState, iAdd);

                % add a new column to CondObsMatrix
                CondObsMatrix = [CondObsMatrix(:, 1:nDirect-1), zeros(nExp, 1), CondObsMatrix(:, nDirect:end)];
                CondObsMatrix(exp, nDirect) = 1;

                % add the new observable to the simulated data and update dynamic flags
                for ex = 1:nExp
                    ySimuAll{ex} = [ySimuAll{ex}(:, 1:nDirect-1), xSimuAll{ex}(:, iAdd), ySimuAll{ex}(:, nDirect:end)];
                end
                qDynamicObs = checkCurveDynamics(ySimuAll, dynTol);

            else
                % no observable or state shows dynamics in this experiment
                % -> keep at least one constant observable
                iAdd = find(removeConstObs(exp, :));
                iAdd = iAdd(randi(length(iAdd)));
                removeConstObs(exp, iAdd) = 0;
                CondObsMatrix(exp, iAdd) = 1;
            end
            
        end
    end
end

% check if every observable appears in at least on condition
for iObs = nObs:-1:1
    if sum(CondObsMatrix(:, iObs), "omitnan") == 0
        % observable does not appear in any condition
        % -> remove the observable

        % update indices
        nObs = nObs - 1;
        if iObs <= nDirect
            % directly observed state
            nDirect = nDirect - 1;
            idDirect(iObs) = [];
        else
            % compound
            nComp = nComp - 1;
            idComp(iObs+nDirect) = [];
        end

        % remove the column from CondObsMatrix
        CondObsMatrix(:, iObs) = [];

        % remove the observable from the simulated data and update dynamic flags
        for ex = 1:nExp
            ySimuAll{ex}(:, iObs) = [];
        end
        qDynamicObs = checkCurveDynamics(ySimuAll, dynTol);
    end
end

% parameter indices
paramIndices = NaN(size(CondObsMatrix));
for iObs = 1:nObs
    column = CondObsMatrix(:, iObs);
    nParams = sum(column, "omitnan");
    paramIndices(column==1, iObs) = 1:nParams;
end

% draw indices for log, scale and offset
qLog = logical(binornd(1, pLog, 1, nObs));              % logical for log scale (1) or lin scale (0)
idScale = sort(randperm(nObs, nScale));                 % scaled observables
idOffset = sort(idScale(randperm(nScale, nOffset)));    % offset observables (subset of scaled)

% remaining problem: if an observable can become zero or negative, we cannot use a log scale
% exception if only zero at t=0
for ex = 1:nExp
    ySimuLog = ySimuAll{ex}(:, qLog);
    qLog(any(ySimuLog(1,:)<0) | any(ySimuLog(2:end,:)<=0, 1)) = false;
end

% draw the std of the error model for all observables from mixed-effect model
% see Eq. (2.8) in Egert_2023 (DOI: 10.3934/mbe.2023467)
% but coefficients are different!
stdObsRaw = -0.96 + randn(1)*0.3 + randn(nExp, nObs)*0.014;
stdObsRaw(CondObsMatrix==0) = NaN;  % set std to NaN for unobserved observables
stdObs = stdObsRaw;
obsMean = NaN(nExp, nObs);
for ex = 1:nExp
    ySimu = ySimuAll{ex};
    for iObs = 1:nObs
        if CondObsMatrix(ex, iObs)>0
            % observable should be measured
            % -> calculate the mean magnitude of the observable
            %    to transform relative to absolute error
            traj = ySimu(isfinite(ySimu(:, iObs)), iObs);
            meanMagnitude = log10(mean(traj, 'omitnan'));
            obsMean(ex, iObs) = meanMagnitude;
            if ~qLog(iObs) && isfinite(meanMagnitude)
                % only possible if meanMagnitude is not NaN or Inf
                % this would be the case if the observable is always zero or negative
                stdObs(ex, iObs) = stdObs(ex, iObs) + meanMagnitude;
            end

        end
    end
end

% check if we have to increase the add_c parameter
minStdObs = min(stdObs(:));
add_c = -2.0*log(minStdObs);            % exact relation for required add_c
add_c = add_c + 10;                     % add some margin (corresponding to 5 orders of magnitude in std)
add_c = ceil(add_c/10)*10;              % round to next 10 (to get a nice number)
add_c = min(add_c, 100);                % maximum value for add_c
add_c = max(add_c, ar.config.add_c);    % minimum value for add_c

if add_c ~= ar.config.add_c
    ar.config.add_c = add_c;
end

% define true values for offset parameters
% The offset should be 2 order of magnitude smaller than the mean magnitude.
% This way the observable is not shifted too much.
% And the offset does not interfere with calculation of the error model.
offsetVal = nan(nExp, nObs);
offsetVal(:, idOffset) = floor(obsMean(:, idOffset)-2);

% bundel results in a struct
obsStruct = struct();
obsStruct.states = inclStates;
obsStruct.nObs = nObs;
obsStruct.nDirect = nDirect;
obsStruct.nComp = nComp;
obsStruct.idDirect = idDirect;
obsStruct.idComp = idComp;
obsStruct.qLog = qLog;
obsStruct.idScale = idScale;
obsStruct.idOffset = idOffset;
obsStruct.CondObsMatrix = CondObsMatrix;
obsStruct.paramIndices = paramIndices;
obsStruct.stdObsRaw = stdObsRaw;
obsStruct.stdObs = stdObs;
obsStruct.obsMean = obsMean;
obsStruct.offsetVal = offsetVal;

% create observable names and expressions
obsStruct = arCreateObsNames(obsStruct);

% sort the fields
obsStruct = sortStruct(obsStruct);

fprintf('Observables drawn realistically.\n')

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AUXILLARY FUNCTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function obsStruct = arCreateObsNames(obsStruct)

% create observable names and expressions
obsNames = cell(1, obsStruct.nObs);
obsExprs = cell(1, obsStruct.nObs);
for iObs = 1:obsStruct.nObs
    if iObs <= obsStruct.nDirect
        % directly observed states
        idObs = obsStruct.idDirect(iObs);
        obsNames{iObs} = sprintf('%s_Obs', obsStruct.states{idObs});
        obsExprs(iObs) = obsStruct.states(idObs);
    else
        % compounds
        iComp = iObs - obsStruct.nDirect;
        % compName = strjoin(obsStruct.states(obsStruct.idComp(iComp, :)), '_add_');
        % if length(compName) > 63
        %     compName = compName(1:63);
        % end
        compName = sprintf('Compound_%i_Obs', iComp);
        obsNames{iObs} = compName;
        obsExprs{iObs} = strjoin(obsStruct.states(obsStruct.idComp(iComp, :)), '+');
    end
    % scale and offset parameters
    if any(obsStruct.idScale==iObs)
        % introduce scaling parameter
        obsExprs{iObs} = sprintf('scale%s_%s*(%s)', ...
                                 '%i', obsNames{iObs}, obsExprs{iObs});
        if any(obsStruct.idOffset==iObs)
            % introduce offset parameter
            obsExprs{iObs} = sprintf('offset%s_%s+%s', ...
                                     '%i', obsNames{iObs}, obsExprs{iObs});
        end
    end
end

obsStruct.obsNames = obsNames;
obsStruct.obsExprs = obsExprs;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

if iscell(trajectories)
    qDynamic = cellfun(@(x) checkCurveDynamics(x, rtol), trajectories, ...
        'UniformOutput', false);
    try
        qDynamic = vertcat(qDynamic{:});
    end
    return
end

relRange = range(trajectories)./max(trajectories);
qDynamic = (relRange > rtol);

end
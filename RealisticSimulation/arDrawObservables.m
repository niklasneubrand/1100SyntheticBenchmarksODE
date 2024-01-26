function obsStruct = arDrawObservables(m, qLogObs, qRemoveConstObs)
%OBSERVABLES Define Observables
%   Detailed explanation goes here

arguments
    m (1,1) double {mustBeInteger, mustBePositive} = 1
    qLogObs (1,1) logical = false
    qRemoveConstObs (1,1) logical = false
end

global ar  %#ok<*GVMIS>

%% Find the dynamical states of the main model condition
states = ar.model(m).x;                                 % all species names
cMain = arFindMainCondition(m, false, false);           % index of main condition
xFineSimu = ar.model(m).condition(cMain).xFineSimu;     % species trajectories
qDynamicState = arCondDynamicStates(m, cMain, false, true);
states(~qDynamicState) = [];                            % remove constant states
nStates = length(states);

if nStates == 0
    error('Only constant species found, no dynamics.')
elseif nStates < 5
    warning('Only found %d dynamic species. A minimum of 5 is required.', nStates)
end

%% Draw observables for main condition
% load the table with the statistical information about the observables
load(fullfile(fileparts(mfilename('fullpath')), 'ObservableDraw.mat'), 'obs');

% Draw number of all observables
randRow = randi(length(obs.obs));       % random row in obs table
nObs = round(obs.obs(randRow)*nStates); % corresp. number of observables
nObs = min(nObs, nStates);              % upper bound for nObs
nObs = max(nObs, 1);                    % lower bound for nObs

% draw number of compounds and directly observed variables
randRow = randi(length(obs.comp));              % random row in obs table
nComp = round(obs.comp(randRow)*nObs);          % corresp. number of compounds
nComp = min(nComp, nObs);                       % upper bound for nComp
compSize = round(obs.compadd(randRow));         % corresp. size of compounds
compSize = min(compSize, nStates);              % upper bound
compSize = max(compSize, 2);                    % lower bound
idComp = [];                                    % initialize compound indices
nDirect = nObs - nComp;                         % number of directly observed variables
idDirect = sort(randperm(nStates, nDirect));    % indices for directly observed states

% Draw the compound composition
% In this implementation all compounds have the same length. Could be improved.
if nComp > 0
    % create idComp, a matrix where each row represents a compound.
    % The matrix entries are state indices.
    [~, idComp] = sort(rand(nComp, nStates), 2);    % nComp many permutations of state indices
    idComp = idComp(:, 1:compSize);            % only keep the first compSize indices
    idComp = unique(sort(idComp, 2), 'rows');  % remove possible duplicate compounds
    if size(idComp, 1) < nComp
        % if not enough compounds (i.e. there were duplicates): draw again
        [~, idComp2] = sort(rand(nComp, nStates), 2);
        idComp2 = idComp2(:, 1:compSize);
        idComp = unique([idComp; sort(idComp2, 2)], 'rows');
        if size(idComp, 1) < nComp
            % if still not enough compounds: accept and reduce nComp
            nComp = size(idComp, 1);
        end
    end
    if size(idComp, 1) > nComp
        % if too many compounds, randomly select a subset of size nComp
        idComp = idComp(randperm(size(idComp, 1), nComp), :);
    end
    % calculate the simulated dynamics of the compounds
    compFineSimu = zeros(size(xFineSimu, 1), nComp);
    for icadd = 1:compSize
        compFineSimu = compFineSimu + xFineSimu(:, idComp(:, icadd));
    end
end

% Draw ratio of variables on log scale
if qLogObs
    randRow = randi(length(obs.logobs));  % random row in obs table
    pLog = obs.logobs(randRow);  % corresp. percentage of log observables
else
    pLog = 0;
end

% Draw how many variables have scale, offset and init
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

%% Distribute observables to all conditions
nConds = length(ar.model(m).condition);

% for each observable draw a roandom column with replacement
% from the condition-observable distribution matrix
obsDistrDir = fullfile(ar.info.path, 'ConditionStructure');
mkdir(obsDistrDir);
obsDistrFile = fullfile(obsDistrDir, sprintf('CondObsMatrix_M%i', m));
try
    load(obsDistrFile, 'CondObsMatrix');
catch
    [~, ~, ~, CondObsMatrix] = arStatesParamMatrix(m, 'condition', false);
    save(obsDistrFile, 'CondObsMatrix');
end
randomCols = randi(size(CondObsMatrix, 2), 1, nObs);
CondObsMatrix = CondObsMatrix(:, randomCols);

% conditions without observables
% -> use observables from random other condition (with replacement)
qEmptyCond = sum(CondObsMatrix, 2, "omitnan") == 0;
nEmptyConds = sum(qEmptyCond);
idReplace = find(~qEmptyCond);
randomRows = randi(nConds-nEmptyConds, 1, nEmptyConds);
idReplace = idReplace(randomRows);
CondObsMatrix(qEmptyCond, :) = CondObsMatrix(idReplace, :);

% shift indices to avoid shared parameters
indexShift = max(CondObsMatrix(~qEmptyCond, :), [], 1);
indexShift = repmat(indexShift, nEmptyConds, 1);
CondObsMatrix(qEmptyCond, :) = CondObsMatrix(qEmptyCond, :) + indexShift;


% get the simulated dynamics for states and drawn observables
xFineSimuAll = cell(1, nConds);
yFineSimuAll = cell(1, nConds);
for c = 1:nConds
    % Get the simulated data for the states
    xFineSimu = ar.model(m).condition(c).xFineSimu;  % species trajectories
    xFineSimuAll{c} = xFineSimu;
    % Get the simulated data for the drawn observables
    if nComp == 0
        % there are only directly observed states
        yFineSimuAll{c} = xFineSimu(:, idDirect);
    else
        % there are also compounds
        compFineSimu = zeros(size(xFineSimu, 1), nComp);
        for iComp = 1:nComp
            compFineSimu(:, iComp) = sum(xFineSimu(:, idComp(iComp, :)), 2);
        end
        yFineSimuAll{c} = [xFineSimu(:, idDirect) compFineSimu];
    end
end

% check if states and observables show dynamics or are constant
qDynamicState = false(nConds, nStates);
qDynamicObs = false(nConds, nObs);
for c = 1:nConds
    
    % states
    xFineSimu = xFineSimuAll{c};
    for iState = 1:nStates
        dataRange = range(xFineSimu(:, iState));  % range of simulated dynamics
        normedDataRange = dataRange/max(xFineSimu(:, iState));  % normalized range
        dynTol = 1e-8;  % tolerance for dynamics
        qDynamicState(c, iState) = (abs(dataRange) > dynTol);
        qDynamicState(c, iState) = qDynamicState(c, iState) && (abs(normedDataRange) > dynTol);
        qDynamicState(c, iState) = qDynamicState(c, iState) && isfinite(normedDataRange);
    end
    
    % observables
    yFineSimu = yFineSimuAll{c};
    for iObs = 1:nObs
        dataRange = range(yFineSimu(:, iObs));  % range of simulated dynamics
        normedDataRange = dataRange/max(yFineSimu(:, iObs));  % normalized range
        dynTol = 1e-8;  % tolerance for dynamics
        qDynamicObs(c, iObs) = (abs(dataRange) > dynTol);
        qDynamicObs(c, iObs) = qDynamicObs(c, iObs) && (abs(normedDataRange) > dynTol);
        qDynamicObs(c, iObs) = qDynamicObs(c, iObs) && isfinite(normedDataRange);
    end
end

if qRemoveConstObs
    % for each condition: remove observables that are constant
    % But a condition must have at least one observable!
    % if there are no observables left, we add one.
    % this is done by drawing a random observable (if there are any)
    % or a random state.
    % 
    % This heuristic procedure can be considered unrealistic.
    % therefore it is deactivated by default.

    % remove observables that are constant
    CondObsMatrix(~qDynamicObs) = NaN;

    % check again if all conditions have at least one observable
    for c = 1:nConds
        if sum(CondObsMatrix(c, :), "omitnan") == 0
            if any(qDynamicObs(c, :))
                % at least one drawn observable shows dynamics
                % -> add a random one to the condition
                iAdd = find(qDynamicObs(c, :));
                iAdd = iAdd(randi(length(iAdd)));
                CondObsMatrix(c, iAdd) = CondObsMatrix(c, iAdd) + max(CondObsMatrix(:, iAdd));
                
            elseif any(qDynamicState(c, :))
                % at least one state shows dynamics
                % -> add a random observable to the condition
                iAdd = find(qDynamicState(c, :));
                iAdd = iAdd(randi(length(iAdd)));
                if ismember(iAdd, idDirect)
                    % observable is already defined -> find corresp. field in CondObsMatrix
                    iObs = find(idDirect == iAdd);
                    CondObsMatrix(c, iObs) = CondObsMatrix(c, iObs) + max(CondObsMatrix(:, iObs));
                else
                    % add a completely new observable to the simulation
                    nObs = nObs + 1;
                    nDirect = nDirect + 1;
                    idDirect = [idDirect, iAdd];
                    CondObsMatrix = [NaN(nConds, 1), CondObsMatrix];
                    CondObsMatrix(c, 1) = 1;
                end
                
            else
                % no dynamics at all
                error('No dynamics found in condition %d.', c)
            end
            
        end
    end

    % check if every observable appears in at least on condition
    for iObs = 1:nObs
        if sum(CondObsMatrix(:, iObs), "omitnan") == 0
            % observable does not appear in any condition
            % -> add it to a random condition
            iAdd = find(qDynamicObs(:, iObs));
            iAdd = iAdd(randi(length(iAdd)));
            CondObsMatrix(iAdd, iObs) = 1;
        end
    end

end

% rename the indices in CondObsMatrix to remove skipped numbers
for iObs = 1:nObs
    col = CondObsMatrix(:, iObs);
    nonNan = isfinite(col);
    [~, ~, colIndices] = unique(col(nonNan), "stable");
    CondObsMatrix(nonNan, iObs) = colIndices;
end

% draw indices for log, scale and offset
idLog = binornd(1, pLog, 1, nObs);                      % logical for log scale (1) or lin scale (0)
idScale = sort(randperm(nObs, nScale));                 % scaled observables
idOffset = sort(idScale(randperm(nScale, nOffset)));    % offset observables (subset of scaled)

% draw the std of the error model for all observables from mixed-effect model
% see Eq. (2.8) in Egert_2023 (DOI: 10.3934/mbe.2023467)
% but coefficients are different!
stdObs = cell(1, nObs);
stdObsIndpt = -0.96 + randn(1)*0.3 + randn(nConds, nObs)*0.014;
for iObs = 1:nObs
    nParams = max(CondObsMatrix(:, iObs), [], "omitnan");
    stdObs{iObs} = stdObsIndpt(1:nParams, iObs)';
    for iParam = 1:nParams
        % the following replaces the code frome Janine:
        % stdObs(~idLog) = stdObs(~idLog) + log10(mean(yFineSimu(:, ~idLog), "omitnan"));
        % i am not quite sure why this is done
        % i think: the linear model describes the relative, not absolute error.
        % therefore we have to include the mean value of the dynamics
        idParam = find(CondObsMatrix(:, iObs) == iParam);
        yFineSimu = vertcat(yFineSimuAll{idParam});
        stdObs{iObs}(iParam) = stdObs{iObs}(iParam) + log10(median(yFineSimu(:, iObs), "omitnan"));
    end
end

% bundel results in a struct
obsStruct = struct();
obsStruct.states = states;
obsStruct.nObs = nObs;
obsStruct.nDirect = nDirect;
obsStruct.nComp = nComp;
obsStruct.idDirect = idDirect;
obsStruct.idComp = idComp;
obsStruct.idLog = idLog;
obsStruct.idScale = idScale;
obsStruct.idOffset = idOffset;
obsStruct.CondObsMatrix = CondObsMatrix;
obsStruct.stdObs = stdObs;

fprintf('Observables drawn realistically.\n')

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AUXILLARY FUNCTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [iMainCond, exitFlag] = arFindMainCondition(m, qFit, qSimu)
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

% check if model has multiple conditions
nConds = length(ar.model(m).condition);
if nConds == 1
    iMainCond = 1;
    exitFlag = 'singleCondition';
    return
end

% find conditions with fewest replacements (closest to WT)
condStruct = arModelConditions(m);
nRepl = cellfun(@length, condStruct.condReplace);
shortConds = find(nRepl == min(nRepl));
if length(shortConds)==1
    iMainCond = shortConds;
    exitFlag = 'fewestReplacements';
    return
end

% find conditions with most dynamic states
nDynamicStates = zeros(1, nConds);
for c = shortConds
    qDynamicState = arCondDynamicStates(m, c, false, false);
    nDynamicStates(c) = sum(qDynamicState);
end
maxDynStatesCond = find(nDynamicStates == max(nDynamicStates));
if length(maxDynStatesCond) == 1
    iMainCond = maxDynStatesCond;
    exitFlag = 'mostDynamicStates';
    return
end

% find conditions with most observables
nObs = zeros(1, nConds);
for c = maxDynStatesCond
    nObs(c) = length(vertcat(ar.model(m).data(ar.model(m).condition(c).dLink).fy));
end
maxObsCond = find(nObs == max(nObs));
if length(maxObsCond) == 1
    iMainCond = maxObsCond;
    exitFlag = 'mostObservables';
    return
end

% find condition with most data points
nData = zeros(1, nConds);
for c = maxObsCond
    nData(c) = numel(ar.model(m).data(ar.model(m).condition(c).dLink).yExp);
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
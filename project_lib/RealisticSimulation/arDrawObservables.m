function obsStruct = arDrawObservables(m, rngSeed, qLogObs, qRemoveConstObs, RSTemplate)
%OBSERVABLES Define Observables
%   Detailed explanation goes here

arguments
    m (1,1) double {mustBeInteger, mustBePositive} = 1
    rngSeed (1,:) = 'shuffle'
    qLogObs (1,1) logical = false
    qRemoveConstObs (1,1) logical = false
    RSTemplate (1,1) struct = arCreateRSTemplate()
end

global ar  %#ok<*GVMIS>

%% Set random number generator
rng(rngSeed);

%% Simulate the model to get the dynamics
try
    arSimu(false, true, true);  % fine points
    arSimu(false, false, true); % experimental
catch ME
    msgText = getReport(ME, "extended", "hyperlinks", "on");
    warning('Error in arSimu: %s', msgText)
end

%% Decide which states to include (remove states that are constant in too many conditions)
inclRatio = 0.2;                                    % minimal ratio of dynamical experiments for state inclusion
ratioDynStates = arDynCondStates(1, RSTemplate, 1); % for each state, ration of experiments with dynamics
qInclState = ratioDynStates >= inclRatio;           % include states with sufficient ratio of dynamic conditions
inclStates = ar.model(m).x(qInclState);             % names of included states
nInclStates = length(inclStates);                   % number of included states

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
nObs = round(obs.obs(randRow)*nInclStates);  % corresp. number of observables
nObs = min(nObs, nInclStates);               % upper bound for nObs
nObs = max(nObs, 1);                            % lower bound for nObs

% draw number of compounds and directly observed variables
randRow = randi(length(obs.comp));              % random row in obs table
nComp = round(obs.comp(randRow)*nObs);          % corresp. number of compounds
nComp = min(nComp, nObs);                       % upper bound for nComp
compSize = round(obs.compadd(randRow));         % corresp. size of compounds
compSize = min(compSize, nInclStates);       % upper bound
compSize = max(compSize, 2);                    % lower bound
% the number of unique compounds is limited to the possible number of combinations
nComp = min(nComp, nchoosek(nInclStates, compSize)); % upper bound for nComp
idComp = [];                                    % initialize compound indices
nDirect = nObs - nComp;                         % number of directly observed variables
idDirect = sort(randperm(nInclStates, nDirect)); % indices for directly observed states

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
if qLogObs
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

%% Distribute observables to all conditions

% for each observable draw a roandom column with replacement
% from the condition-observable distribution matrix
CondObsMatrix = RSTemplate.condObsMatrix;
randomCols = randi(size(CondObsMatrix, 2), 1, nObs);
CondObsMatrix = CondObsMatrix(:, randomCols);

% conditions without observables
% add a random observable to the condition
qEmptyCond = sum(CondObsMatrix, 2, "omitnan") == 0;
nEmptyConds = sum(qEmptyCond);
randObs = randi(nObs, 1, nEmptyConds);
CondObsMatrix(qEmptyCond, randObs) = 1;

% parameter indices
paramIndices = NaN(size(CondObsMatrix));
for iObs = 1:nObs
    column = CondObsMatrix(:, iObs);
    nParams = sum(column, "omitnan");
    paramIndices(column==1, iObs) = 1:nParams;
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

    % Get the simulated data for the states (at the experiments time points)
    xExpSimu = [];
    for c = cLink
        xExpSimu = [xExpSimu; ar.model(m).condition(c).xExpSimu(:, qInclState)];
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


if qRemoveConstObs
    % for each condition: remove observables that are constant
    % But a condition must have at least one observable!
    % if there are no observables left, we add one.
    % this is done by drawing a random observable (if there are any)
    % or a random state.
    % 
    % This heuristic procedure can be considered unrealistic.
    % therefore it is deactivated by default.

    % first: find constant states and observables
    qDynamicState = false(nConds, nInclStates);
    qDynamicObs = false(nConds, nObs);
    for c = 1:nConds

        % states
        xFineSimu = xSimuAll{c};
        for iState = 1:nInclStates
            dataRange = range(xFineSimu(:, iState));  % range of simulated dynamics
            normedDataRange = dataRange/max(xFineSimu(:, iState));  % normalized range
            dynTol = 1e-8;  % tolerance for dynamics
            qDynamicState(c, iState) = (abs(dataRange) > dynTol);
            qDynamicState(c, iState) = qDynamicState(c, iState) && (abs(normedDataRange) > dynTol);
            qDynamicState(c, iState) = qDynamicState(c, iState) && isfinite(normedDataRange);
        end

        % observables
        ySimu = ySimuAll{c};
        for iObs = 1:nObs
            %% here the is a bug: somtimes iObs exceeds array bounds.
            % I hope it is fixed now by limiting the number of compounds to the
            % number of possible unique compounds (nStates choose compSize)
            dataRange = range(ySimu(:, iObs));  % range of simulated dynamics
            normedDataRange = dataRange/max(ySimu(:, iObs));  % normalized range
            dynTol = 1e-8;  % tolerance for dynamics
            qDynamicObs(c, iObs) = (abs(dataRange) > dynTol);
            qDynamicObs(c, iObs) = qDynamicObs(c, iObs) && (abs(normedDataRange) > dynTol);
            qDynamicObs(c, iObs) = qDynamicObs(c, iObs) && isfinite(normedDataRange);
        end
    end

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
                CondObsMatrix(c, iAdd) = 1;
                
            elseif any(qDynamicState(c, :))
                % at least one state shows dynamics
                % -> add a random observable to the condition
                iAdd = find(qDynamicState(c, :));
                iAdd = iAdd(randi(length(iAdd)));
                if ismember(iAdd, idDirect)
                    % observable is already defined -> find corresp. field in CondObsMatrix
                    iObs = find(idDirect == iAdd);
                    CondObsMatrix(c, iObs) = 1;
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

% draw indices for log, scale and offset
idLog = binornd(1, pLog, 1, nObs);                      % logical for log scale (1) or lin scale (0)
idScale = sort(randperm(nObs, nScale));                 % scaled observables
idOffset = sort(idScale(randperm(nScale, nOffset)));    % offset observables (subset of scaled)

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
        if CondObsMatrix(ex, iObs)>0 && ~idLog(iObs)
            % observable is defined and not on log scale
            % -> calculate the mean magnitude of the observable
            %    to transform relative to absolute error
            traj = ySimu(isfinite(ySimu(:, iObs)), iObs);
            meanMagnitude = log10(mean(traj, 'omitnan'));
            obsMean(ex, iObs) = meanMagnitude;
            if isfinite(meanMagnitude)
                % only possible if meanMagnitude is not NaN or Inf
                % this would be the case if the observable is always zero or negative
                stdObs(ex, iObs) = stdObs(ex, iObs) + meanMagnitude;
            end

            % % we have to introduce a minimum value for the std
            % % otherwise arCalcSimu throws an error
            % % the condition is: 0 >! 2*log(ystd) + ar.config.add_c ==> ystd > exp(-ar.config.add_c/2)
            % minStd = exp(-ar.config.add_c/2);
            % orderOfMag = floor(log10(minStd));
            % % round the significand upwards
            % minStd = ceil(minStd/10^orderOfMag)*10^orderOfMag;
            % stdObs(ex, iObs) = max(stdObs(ex, iObs), minStd);
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

% bundel results in a struct
obsStruct = struct();
obsStruct.states = inclStates;
obsStruct.nObs = nObs;
obsStruct.nDirect = nDirect;
obsStruct.nComp = nComp;
obsStruct.idDirect = idDirect;
obsStruct.idComp = idComp;
obsStruct.idLog = idLog;
obsStruct.idScale = idScale;
obsStruct.idOffset = idOffset;
obsStruct.CondObsMatrix = CondObsMatrix;
obsStruct.paramIndices = paramIndices;
obsStruct.stdObsRaw = stdObsRaw;
obsStruct.stdObs = stdObs;
obsStruct.obsMean = obsMean;

% create observable names and expressions
obsStruct = arCreateObsNames(obsStruct);

% add main condition and flag
obsStruct.cMain = cMain;
obsStruct.mainCondFlag = mainCondFlag;

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
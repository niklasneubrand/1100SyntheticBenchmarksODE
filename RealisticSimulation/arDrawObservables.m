function obsStruct = arDrawObservables(iModel, iCond, qLogObs)
%OBSERVABLES Define Observables
%   Detailed explanation goes here

arguments
    iModel (1,1) double {mustBeInteger, mustBePositive} = 1
    iCond (1,1) double {mustBeInteger, mustBePositive} ...
        = arFindMainCondition(iModel, false, false)
    qLogObs (1,1) logical = false
end

global ar  %#ok<*GVMIS>

% Find the dynamical states
states = ar.model(iModel).x;  % all species names
xFineSimu = ar.model(iModel).condition(iCond).xFineSimu;  % species trajectories
qDynamicState = arCondDynamicStates(iModel, iCond, false, true);
states(~qDynamicState) = [];  % remove constant states
ns = length(states);
if ns == 0
    error('Only constant species found, no dynamics.')
elseif ns < 5
    warning('Only found %d dynamic species. A minimum of 5 is required.', ns)
end

% load the table with the statistical information about the observables
load([fileparts(mfilename('fullpath')) filesep 'ObservableDraw.mat']);

% Draw number of all observables
randRow = randi(length(obs.obs));   % random row in obs table
nObs = round(obs.obs(randRow)*ns);  % corresp. number of observables
nObs = min(nObs, ns);               % upper bound for nObs

% Draw number and size of compounds
% In this implementation all compounds have the same length.
% This could be more realistic by also considerung compounds of different length.
% e.g. also calculate the standard deviation of compund sizes in the benchmark models
% and draw the size of each compound from a normal distribution with this mean and std.
randRow = randi(length(obs.comp));      % random row in obs table
nComp = round(obs.comp(randRow)*nObs);  % corresp. number of compounds
compSize = round(obs.compadd(randRow)); % corresp. size of compounds
nComp = min(nComp, nObs);               % upper bound for nComp
compSize = min(compSize, ns);           % upper bound for compSize
idComp = [];                            % initialize idComp

% randomly draw the compound compositions
if nComp > 0
    % create idComp, a matrix where each row represents a compound.
    % The matrix entries are state indices.
    [~, idComp] = sort(rand(nComp, ns), 2);    % nComp many permutations of state indices
    idComp = idComp(:, 1:compSize);            % only keep the first compSize indices
    idComp = unique(sort(idComp, 2), 'rows');  % remove possible duplicate compounds
    if size(idComp, 1) < nComp
        % if not enough compounds (i.e. there were duplicates): draw again
        [~, idComp2] = sort(rand(nComp, ns), 2);
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

% draw indices for different types of observables
idDirectObs = sort(randperm(ns, nObs-nComp));   % non-compound, i.e., directly observed states
idLog = binornd(1, pLog, 1, nObs);              % logical for log scale (1) or lin scale (0)
idScale = sort(randperm(nObs, nScale));         % scaled observables
idOffset = sort(idScale(randperm(nScale, nOffset)));    % offset observables (subset of scaled)

% Get the simulated data for the drawn observables
if nComp > 0
    yFineSimu = [xFineSimu(:, idDirectObs) compFineSimu];
else
    yFineSimu = xFineSimu(:, idDirectObs);
end

% draw the std of the error model for all observables from mixed-effect model
% see Eq. (2.8) in Egert_2023 (DOI: 10.3934/mbe.2023467)
% but coefficients are different!
% this could be extended to cover a condition specific effect
stdObs = -0.96 + randn(1)*0.3 + randn(1, nObs)*0.014;
stdObs(~idLog) = stdObs(~idLog) + log10(mean(yFineSimu(:, ~idLog), "omitnan"));  % not sure why

% bundel results in a struct
obsStruct = struct();
obsStruct.states = states;
obsStruct.nObs = nObs;
obsStruct.nDirectObs = nObs - nComp;
obsStruct.nComp = nComp;
obsStruct.idDirectObs = idDirectObs;
obsStruct.idComp = idComp;
obsStruct.idLog = idLog;
obsStruct.idScale = idScale;
obsStruct.idOffset = idOffset;
obsStruct.stdObs = stdObs;


% Write in ar
% ar.model.data.yFineSimu = yFineSimu;
% ar.model.data.y = ystates;
% ar.model.data.tFine = ar.model.condition.tFine;

fprintf('Observables assigned. \n');
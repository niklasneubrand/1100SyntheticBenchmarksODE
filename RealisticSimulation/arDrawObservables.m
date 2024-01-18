function obsStruct = arDrawObservables(cond, qLogObs)
%OBSERVABLES Define Observables
%   Detailed explanation goes here
if ~exist('cond', 'var') || isempty(cond)
    cond=1;
end
if ~exist('qLogObs', 'var') || isempty(qLogObs)
    fprintf('No information about logging given. Logarithm of observables is drawn realisticly. \nWatch out! Logarithm of intensities can cause differences to original model. If this is not what you want, set arRealisticDesign([],false).\n')
    qLogObs = false;
end

global ar  %#ok<*GVMIS>


states = ar.model(1).x;  % all species names

load([fileparts(mfilename('fullpath')) filesep 'ObservableDraw.mat']);

% Are there constant states ? Throw them out.

% this is condition dependent!
arSimu(false, true, true);
xFineSimu = ar.model(1).condition(cond).xFineSimu;
% idConstXSimu = [];
% for i = 1:size(xFineSimu, 2)
%     dataRange = range(xFineSimu(:, i));  % range of simulated dynamics
%     normedDataRange = dataRange/max(xFineSimu(:, i));  % normalized range
%     constTol = 1e-8;  % tolerance to decide if dynamics are considered constant
%     if (abs(dataRange) < constTol || abs(normedDataRange) < constTol || ~isfinite(normedDataRange))
%         idConstXSimu = [idConstXSimu i];
%     end
% end
% xFineSimu(:,idConstXSimu) = [];
% states(idConstXSimu) = [];
ns = length(states);
% if ns == 0
%     error('No dynamics found, just constants. Check in arSetObservables.m')
% end
% if ns < 5
%     error('Realistic Design not trained for less than 5 dynamic species.')
% end

% Draw number of all observables
randRow = randi(length(obs.obs));   % random row in obs table
nObs = round(obs.obs(randRow)*ns);  % corresp. number of observables
nObs = min(nObs, ns);               % upper bound for nObs

% Draw number and size of compounds
% In this implementation all compounds have the same length.
% This could be more realistic by also considerung compounds of different length.
% e.g. also calculate the standard deviation of compund size for each model,
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
    % nInit = round(obs.initlog(randi(length(obs.initlog)))*nObs);
else
    % less than 50% of observables are on log scale
    % -> draw number of scale, offset and init as if all were on non-log scale
    nScale = round(obs.scanonlog(randi(length(obs.scanonlog)))*nObs);
    nOffset = round(obs.offnonlogrel(randi(length(obs.offnonlogrel)))*nScale);
    % nInit = round(obs.initnonlog(randi(length(obs.initnonlog)))*nObs);
end

% draw indices for different types of observables
idDirectObs = sort(randperm(ns, nObs-nComp));   % non-compound, i.e., directly observed states
idLog = binornd(1, pLog, 1, nObs);              % logical for log scale (1) or lin scale (0)
idScale = sort(randperm(nObs, nScale));         % scaled observables
idOffset = sort(idScale(randperm(nScale, nOffset)));    % offset observables (subset of scaled)
% idInit = sort(randperm(nObs, nInit));           % initial values

% directObs = states(idDirectObs);
% statescomind = states(idComp);

% Get the simulated data for the drawn observables
if nComp > 0
    yFineSimu = [xFineSimu(:, idDirectObs) compFineSimu];
else
    yFineSimu = xFineSimu(:, idDirectObs);
end
% initValues = NaN(1, nInit);
% for iInit = 1:nInit
%     positiveValues = yFineSimu(yFineSimu(:, idInit(iInit))>0, idInit(iInit));
%     initValues(iInit) = log10(min(positiveValues, [], "omitnan")/2);
% end

% draw the std of the error model for all observables from mixed-effect model
% see Eq. (2.8) in Egert_2023 (DOI: 10.3934/mbe.2023467)
% but coefficients are different!
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
obsStruct.idInit = idInit;
obsStruct.initValues = initValues;
obsStruct.stdObs = stdObs;


% Write in ar
% ar.model.data.yFineSimu = yFineSimu;
% ar.model.data.y = ystates;
% ar.model.data.tFine = ar.model.condition.tFine;

fprintf('Observables assigned. \n');
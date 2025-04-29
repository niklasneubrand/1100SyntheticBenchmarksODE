function [nSeeds, qReset] = arSetRealisticParams(paramSeed, projectPath)

global ar

pStart = ar.p;
qFeasibleParams = false;

nSeeds = 0;
while ~qFeasibleParams

    % initialize new iteration
    nSeeds = nSeeds + 1;
    qReset = false(size(ar.p));
    ar.p = pStart;

    % calculate new parameters
    % multiply pStart by a random factor between 1/2 and 2
    [pNew, factors] = arRandomRealisticParams(2, 'log-uniform', paramSeed);
    pNew = round(pNew, 3, 'significant');
    ar.p = pNew;

    % simulate dynamics to check if parameters are feasible
    % use multiple tries to increase robustness
    [qFeasibleParams, lastConfig] = arSimuMultiTries(true, "nCVRestart", 5);
    if qFeasibleParams
        % if feasible with these configs -> use them
        configs = fieldnames(lastConfig);
        for i = 1:length(configs)
            ar.config.(configs{i}) = lastConfig.(configs{i});
        end
    
    elseif ~qFeasibleParams
        % check if a single parameter is responsible for convergence failure
        % and reset it to the original value
        maxReset = floor(sum(factors ~= 1)/4);  % reset at most 1/4 of the randomized parameters
        [qFeasibleParams, factors, qReset] = arCheckAndResetParams(factors, pNew, pStart, maxReset, true);

        if ~qFeasibleParams
            % if no single parameter reset was sufficient
            % reset multiple parameters at a time
            [qFeasibleParams, factors, qReset] = arCheckAndResetParams(factors, pNew, pStart, maxReset, false);

            % still no feasible parameters -> try again with a new seed
            if ~qFeasibleParams
                paramSeed = paramSeed + 1;
            end
        end
    end

    if nSeeds > 100
        error('Could not find feasible parameters after 100 tries.')
    end
end

%% feasile parameters found -> update bounds of dynamic parameters
% remember the original bounds
lb = ar.lb;
ub = ar.ub;
p = ar.p;
qDynamic = logical(ar.qDynamic);

% round the bounds to have a nice number
lb = round(lb, 2, 'significant');
ub = round(ub, 2, 'significant');

% increase the bounds if violated
boundRanges = range([lb; ub]);
boundIncreaseFactor = 0.1;
lbViolated = p<lb & qDynamic;
ubViolated = p>ub & qDynamic;
lb(lbViolated) = lb(lbViolated) - boundIncreaseFactor*boundRanges(lbViolated);
ub(ubViolated) = ub(ubViolated) + boundIncreaseFactor*boundRanges(ubViolated);

% round again because of the violation fix
lb = round(lb, 2, 'significant');
ub = round(ub, 2, 'significant');

% set the new bounds
ar.lb = lb;
ar.ub = ub;

% save outcome variables for traceability
if exist('projectPath', 'var') && ~isempty(projectPath)
    [~, projectName] = fileparts(projectPath);
    paramStruct = struct(...
        'nSeeds',       nSeeds, ...
        'paramSeed',    paramSeed, ...
        'pNew',         ar.p, ...
        'pOld',         pStart, ...
        'pLabel',       {ar.pLabel}, ...
        'qReset',       qReset, ...
        'factors',      factors);
    save(fullfile(projectPath, 'Auxillary', sprintf('params_%s', projectName)), 'paramStruct');
end

fprintf('Parameters set realistically.\n')
fprintf('To ensure ODE sovler feasibility:\n%d random parameter seeds were tested,\n%d/%d parameters were randomized.\n', nSeeds, sum(qReset==0), length(ar.p));

end


function [qFeasibleParams, factors, qReset] = arCheckAndResetParams(factors, pNew, pStart, maxReset, qSingleParamReset)

global ar

% sort the parameters by from most extreme to least extreme factor
[~, idx] = sort(abs(log10(factors)), 'descend');
nMax = sum(factors ~= 1);
maxReset = min(nMax, maxReset);

factorsNew = factors;
qReset = false(size(ar.p));

% check which parameters are responsible for convergence failure
for ii = 1:nMax

    % reset next parameter to the original value
    ip = idx(ii);
    ar.p(ip) = pStart(ip);
    factors(ip) = 1;
    qReset(ip) = true;

    % simulate dynamics to check if parameters are feasible
    % to save compute power we only simulate once
    qFeasibleParams = arSimuMultiTries(true, "nCVRestart", 1);

    if qFeasibleParams || sum(qReset)>=maxReset
        break
    end

    if qSingleParamReset
        % only reset one parameter at a time
        % -> if reset does not restore feasibility, restore the new parameter value
        ar.p(ip) = pNew(ip);
        factors(ip) = factorsNew(ip);
        qReset(ip) = false;
    end
end

end
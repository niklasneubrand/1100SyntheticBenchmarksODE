function localOptimizationRestricted(loadName, saveName, config)

arguments
    loadName (1,:) char = 'Final'
    saveName (1,:) char = 'localOptimizationRestricted'
    config.atol = 1e-10
    config.rtol = 1e-10
    config.eq_tol = 1e-10
    config.maxsteps = 1e5
    config.add_c = 80
    config.OptimMaxIter = 1000
    config.nFits = 10
    config.bounds = 0.2
end

diary(sprintf('%s.log', saveName))

%% init d2d and load the final version of the RS
global ar
arInit;
loaded = arLoadLatest(loadName);
if ~loaded
    Setup;
    if ~strcmp(loadName, 'Final')
        arSave(loadName)
    end
end

%% set the configs
% here we overwrite all configs that are set "manually" in the Setup files 
% of the synthetic benchmarks models

% ODE solver tolerances and max steps
ar.config.atol = config.atol;
ar.config.rtol = config.rtol;
ar.config.eq_tol = config.eq_tol;
ar.config.maxsteps = config.maxsteps;

% optimizer settings
ar.config.add_c = config.add_c;
ar.config.optim.MaxIter = config.OptimMaxIter;

% number of cores and threads
arSetParallelThreads();

%% perform the fit
ar.config.logFitting = 1;  % store optimizer trajectory
startTime = cputime;

% use tight bounds for parameters, but allow multiple fits
lb0 = ar.lb;
ub0 = ar.ub;
for i=1:config.nFits
    arSetParsBounds(config.bounds); % set bounds for parameters
    arFit();
end
ar.lb = lb0; % reset bounds
ar.ub = ub0; % reset bounds

fitTime = cputime - startTime;
ar.fit.timing = fitTime; % store the time it took to fit

%% save the results
arSave(saveName)
diary('off')

end
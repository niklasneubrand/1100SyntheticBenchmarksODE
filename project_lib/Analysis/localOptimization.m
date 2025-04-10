function localOptimization(loadName, saveName, config)

arguments
    loadName (1,:) char = 'Final'
    saveName (1,:) char = 'locallyFitted'
    config.atol = 1e-10
    config.rtol = 1e-10
    config.eq_tol = 1e-10
    config.maxsteps = 1e5
    config.add_c = 80
    config.OptimMaxIter = 1000
end

diary('localOptimization.log')

%% init d2d and load the final version of the RS
global ar
arInit;
arLoadLatest('Final')

%% set the configs
% ODE solcer tolerances and max steps
ar.config.atol = config.atol;
ar.config.rtol = config.rtol;
ar.config.eq_tol = config.eq_tol;
ar.config.maxsteps = config.maxsteps;

% optimizer settings
ar.config.add_c = config.add_c;
ar.config.optim.MaxIter = config.OptimMaxIter;

%% perform the fit
ar.config.logFitting = 1;  % store optimizer trajectory
startTime = cputime;
arFit();
fitTime = cputime - startTime;
ar.fit.timing = fitTime; % store the time it took to fit

%% save the results
arSave(outputName)
diary('off')

end
function multistartOptimization(loadName, saveName, nLHS, seed, config)

arguments
    loadName (1,:) char = 'Final'
    saveName (1,:) char = 'multistartOptimization'
    nLHS (1,1) double = 100
    seed (1,1) double = 1
    config.atol = 1e-10
    config.rtol = 1e-10
    config.eq_tol = 1e-10
    config.maxsteps = 1e5
    config.add_c = 80
    config.OptimMaxIter = 1e5
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

%% perform the fit
ar.config.logFitting = 1;  % store optimizer trajectory
arFitLHS(nLHS, seed, true);

%% save the results
arSave(saveName)
diary('off')

end
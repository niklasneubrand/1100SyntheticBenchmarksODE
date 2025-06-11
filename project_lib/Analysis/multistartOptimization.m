function multistartOptimization(loadName, saveName, nLHS, seed, d2dConfig, optimConfig)

% required arguments
arguments
    loadName (1,:) char = 'CompiledProject'
    saveName (1,:) char = 'multistartOptimization'
    nLHS (1,1) double = 100
    seed (1,1) double = 1
end

% name-value pairs for d2d configs in ar.config (relevant subset)
arguments
    d2dConfig.atol (1,1) double = 1e-6
    d2dConfig.rtol (1,1) double = 1e-6
    d2dConfig.eq_tol (1,1) double = 1e-8
    d2dConfig.eq_rtol (1,1) double = 1e-8
    d2dConfig.maxsteps (1,1) double = 1e4
    d2dConfig.add_c (1,1) double = 50
    d2dConfig.atolV (1,1) double = 0
    d2dConfig.atolV_Sens (1,1) double = 0
end

% name-value pairs for optimizer configs in ar.config.optim (relevant subset)
arguments
    optimConfig.MaxIter (1,1) double = 1e3
    optimConfig.TolFun (1,1) double = 0
    optimConfig.TolX (1,1) double = 1e-6
end

diary(sprintf('%s.log', saveName))

%% init d2d and load the final version of the RS
global ar
arInit;
if strcmp(loadName, 'normal')
    % for template we saved with datestring
    arLoadLatest(loadName);
else
    arLoad(loadName);
end

%% set the configs
% here we overwrite all configs that are set "manually" in the Setup files 
% of the synthetic benchmarks models
d2dConfigs = fieldnames(d2dConfig);
for i=1:length(d2dConfigs)
    configName = d2dConfigs{i};
    ar.config.(configName) = d2dConfig.(configName);
end
optimConfigs = fieldnames(optimConfig);
for i=1:length(optimConfigs)
    configName = optimConfigs{i};
    ar.config.optim.(configName) = optimConfig.(configName);
end

% number of cores and threads
arSetParallelThreads();

%% perform the fit
ar.config.logFitting = 1;  % store optimizer trajectory
arFitLHS(nLHS, seed, false);

%% save the results
arSave(saveName)
diary('off')

end
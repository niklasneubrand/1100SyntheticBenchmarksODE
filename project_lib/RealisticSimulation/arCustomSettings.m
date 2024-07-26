function customSettings = arCustomSettings()

global ar

% get default config
ar_copy = arDeepCopy(ar);
arInit;
defaultConfig = ar.config;
ar = arDeepCopy(ar_copy);

%% compare ar.config with defaultConfig and update customSettings
% checkFields is a list of config names that should be checked for differences
% this is a handpicked subset of all fields in ar.config
% I removed options that are related to:
%   1. user interface (plotting, saving, etc.)
%   2. optimization (optimizers, etc.)

checkFields = {
    'fastEquilibration', 'turboSplines', 'turboSSSensi', 'sensitivitySubset', ...
    ...
    'networkgraph', 'debugExp', 'useCache', 'checkForNegFluxes', 'useParallel', ...
    'nCore', 'nParallel', 'nMaxThreads', ...
    ...
    'ssa_min_tau', 'ssa_runs', ...
    ...
    'add_c', ...
    ...
    'useLHS', ...
    ...
    'useSensis', 'sensiSkip', 'useJacobian', 'useSparseJac', 'useSensiRHS', ...
    'atolV', 'atolV_Sens', ...
    ...
    'atol', 'rtol', 'maxtol', 'useTolTrustPar', 'useTolSwitching', ...
    'maxsteps', 'maxstepsize', 'useEvents', 'useMS', 'nCVRestart', ...
    ...
    'init_eq_step', 'eq_tol', 'eq_rtol', 'max_eq_steps', 'eq_step_factor', ...
    ...
    'rootfinding', ...
    ...
    'steady_state_constraint', ...
    ...
    'no_optimization', ...
    };


customSettings = struct();

for ifield = 1:length(checkFields)
    field = checkFields{ifield};
    
    % if field is missing, use default value
    if ~isfield(ar.config, field)
        ar.config.(field) = defaultConfig.(field);
    
    % if field value differs from default, add to customSettings 
    elseif ~isequal(ar.config.(field), defaultConfig.(field))
        % if both fields are NaN, there is no difference -> skip
        if isnan(ar.config.(field)) && isnan(defaultConfig.(field))
            continue
        end
        customSettings.(field) = ar.config.(field);
    end
end

end



% defaults = { ...
%     {'fastEquilibration',           false}, ...                     % Faster equilibration (BETA). Set to 1 before compiling if you want to enable rootfinding from within C.
%     {'turboSplines',                false}, ...                     % Faster splines (BETA).
%     {'turboSSSensi',                false}, ...                     % Faster equilibration (BETA). Toggle with arFastSensis. DO NOT TOGGLE BY HAND.
%     {'sensitivitySubset',           0}, ...                         % Only compute subset of sensitivities when certain qFit's are 0 (BETA)
%     % {'lightSave',                   false}, ...                     % When calling arSave, only save parameter sets by default (useful for big models)
%     % {'saveMexFile',                true}, ...                       % When calling arSave, the arSimuCalc mex file is copied to the savefolder
%     % {'skipSim',                     false}, ...                     % Disable simulation (used for fitting steady state models)
%     % {'barhack',                     false}, ...                     % Display data with only a single time point as bar
%     {'networkgraph',                false}, ...                     % Enable network graph plotting features (disabled by default since they slow compilation)
%     {'debugExp',                    false}, ...                     % Show crosses with simulation values used for residual calculation in plots
%     {'useCache',                    0}, ...                         % Use caching system (0 = no, 1 = strict (also check tExp, tFine), 2 = sloppy)
%     {'checkForNegFluxes',           2}, ...
%     {'useParallel',                 true}, ...                      % Parallelization
%     {'nCore',                       feature('numCores')}, ...       %   number of available cores
%     {'nParallel',                   2*feature('numCores')}, ...
%     {'nMaxThreads',                 64}, ...
%     ...                                                             % Plotting
%     % {'savepath',                    []}, ...                        %   field for saving the output path
%     % {'backup_modelAndData',         true},...                       %   makes copies of model and data files corresponding for each value of ar.checkstr
%     % {'nFinePoints',                 300}, ...                       %   number of fine time points for plotting
%     % {'par_close_to_bound',          0.01}, ...                      %   notify if parameter within 1% of bound (relative to ub-lb)
%     % {'nfine_dr_method',             'pchip'}, ...                   %   spline
%     % {'nfine_dr_plot',               0}, ...                         %   use value > 10 to enable smoothing of DR curves
%     % {'plot_x_collected',            false}, ...                     %   0 = show seperate subplot for species and inputs, 1 = all in one
%     % {'ploterrors',                  0}, ...                         %   plotting options of error bars: 0=like fitted (error bar if yExpStd available, error band otherwise), 1=only error bars,  2=only error model as error band,  -1=confidence bands, -3: no errors
%     % {'showFitting',                 0}, ...                         %   Show the fitting process in real time
%     % {'showLegends',                 true}, ...                      %   Show legends in plots
%     % {'useSuptitle',                 false}, ...     
%     % {'plotColorSet',                'matlab_default'}, ...          %   set color set for plotting. Alternatives are 'dMod' and 'd2d_legacy'
%     ...                                                             % Stochastic simulation
%     {'ssa_min_tau',                 1e-3}, ...                      
%     {'ssa_runs',                    1}, ...
%     ...                                                             % Fit error handling
%     % {'fiterrors',                   0}, ...                         %   Fit error models?
%     % {'fiterrors_correction',        1}, ...                         %   Field for storing the Bessel-like error correction
%     % {'fiterrors_correction_warning',false}, ...                     %   Field for storing whether the user has been warned of the disabled Bessel-like error correction
%     % {'useFitErrorCorrection',       true}, ...                      %   Use Bessel-like correction when fitting error parameters
%     % {'useFitErrorMatrix',           false}, ...
%     {'add_c',                       50},...                         % additive constant required in arCalcRes.m for lsqnonlin in case of error-fitting
%     ...                                                             % Sampling
%     {'useLHS',                      false}, ...                     %   When sampling random parameters use Latin Hypercube Sampling    
%     ...                                                             % Optimization options
%     % {'showLiveWaterfall',           false}, ...                     %   Show waterfall plot while using arFits   
%     {'useSensis',                   true}, ...                      %   Use sensitivities
%     {'sensiSkip',                   false}, ...                     %   Skip sensitivities during fitting when only func is requested (speed-up for some optimizers)
%     {'useJacobian',                 true}, ...                      %   Use Jacobian
%     {'useSparseJac',                false}, ...                     %   Use Sparse Jacobian
%     {'useSensiRHS',                 true}, ...                      %   Use sensitivities of RHS during simulation
%     {'atolV',                       false}, ...                     %   Observation scaled tolerances
%     {'atolV_Sens',                  false}, ...                     %   Sensi tolerances?
%     % {'optimizer',                   1}, ...                         %   Default optimizer
%     % {'optimizers',                  {'lsqnonlin', 'fmincon', 'PSO', 'STRSCNE', 'arNLS', 'fmincon_as_lsq', 'arNLS_SR1',...
%     %                                  'NL2SOL','TRESNEI','Ceres', 'lsqnonlin_repeated', 'fminsearchbnd', 'patternsearch',...
%     %                                  'patternsearch_hybrid', 'particleswarm', 'simulannealbnd', 'geneticalgorithm', 'lsqnonlinHeuristics'} }, ...
%     % ...                                                             % CVODES settings
%     {'atol',                        1e-6}, ...                      %   Absolute tolerance
%     {'rtol',                        1e-6}, ...                      %   Relative tolerance
%     {'maxtol',                      1e-10}, ...                     %   Minimal tolerance used in regulating algorithms
%     {'useTolTrustPar',              0}, ...                         %   Use parallel shrinkage of integration tolerances with optimizer trust region
%     {'useTolSwitching',             0}, ...                         %   Use switch to strict integrator tolerances if trust region step is rejected
%     {'maxsteps',                    1000}, ...                      %   Maximum number of steps before timeout
%     {'maxstepsize',                 1e6}, ...                       %   Maximum stepsize
%     {'useEvents',                   0}, ...                         %   Use event system
%     {'useMS',                       0}, ...                         %   Use multiple shooting (DEPRECATED)
%     {'nCVRestart',                  NaN}, ...                       %   Maximum number of automatic restarts
%     ...                                                             % Simulation based equilibration settings
%     {'init_eq_step',                100.0}, ...                     %   Simulation time of initial equilibration attempt
%     {'eq_tol',                      1e-8}, ...                      %   Value below which all components of dxdt have to fall to be considered equilibrated
%     {'eq_rtol',                     1e-8}, ...                      %   Relative value below which all components of dxdt have to fall to be considered equilibrated
%     {'max_eq_steps',                20}, ...                        %   Maximum number of times the equilibration time is extended
%     {'eq_step_factor',              5}, ...                         %   Factor by which the equilibration time is extended when dxdt isn't below eq_tol
%     ...                                                             % Rootfinding based equilibration settings
%     {'rootfinding',                 0},...                          %   Determine steady states by rootfinding rather than simulation
%     ...                                                             % Constraint based steady states
%     {'steady_state_constraint',     1}, ...                         %   Enable system
%     ...
%     % {'instantaneous_termination',   1}, ...                    	    % Poll utIsInterruptPending() to respond to CTRL+C
%     {'no_optimization',             0}, ...                         % Disable compiler optimization                                                         
%     };
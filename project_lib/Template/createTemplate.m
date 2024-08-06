function template = createTemplate(qCondObsMatrix, qPlot, qSave2File)

arguments
    qCondObsMatrix (1,1) logical = true
    qPlot (1,1) logical = false
    qSave2File (1,1) logical = true
end

global ar  %#ok<*GVMIS>

template = struct();

%% analyze conditions
condStruct = arModelConditions();
template.condStruct = condStruct;

%% analyze data
nData = length(ar.model.data);
template.timeCourse = struct();
template.doseResponse = struct();

% decide condition types (time-course TC, dose-response DR, or both)
tc = 0;
dr = 0;

for d = 1:nData

    % every data file is linked to exactly one condition
    c = ar.model.data(d).cLink;

    % time-course data
    if ~ar.model.data(d).doseresponse
        tc = tc + 1;

        % condition link
        template.timeCourse(tc).cLink = c;
        template.timeCourse(tc).dLink = d;
        template.timeCourse(tc).condReplace = condStruct.condReplace{c};
    
    % dose-response data
    else
        dr = dr + 1;

        % condition and data link(s)
        template.doseResponse(dr).cLink = c;
        template.doseResponse(dr).dLink = d;

        % response parameter
        response_parameter = ar.model.data(d).response_parameter;
        template.doseResponse(dr).response_parameter = response_parameter;

        % get the response variable's value
        qResponse = strcmp(ar.model.data(d).pold, response_parameter);
        template.doseResponse(dr).values = double(arSym(ar.model.data(d).fp(qResponse)));

        % get the time point(s)
        tExp = ar.model.data(d).tExp;
        template.doseResponse(dr).tExp = tExp(1);
        template.doseResponse(dr).nReplica = length(tExp);

        % set the replacements for remaining parameters
        condRep = condStruct.condReplace{c};
        qResp = strcmp(condRep(:, 1), response_parameter);
        condRep = condRep(~qResp, :);
        template.doseResponse(dr).condReplaceRest = condRep;

    end
end

% merge data in a meaningful way
template = mergeTimecourse(template);
template = mergeDoseresponse(template);
template.nTC = length(template.timeCourse);
template.nDR = length(template.doseResponse);
template.nExp = template.nTC + template.nDR;

%% analyze steady states and events
template.findInputs = ~isempty(ar.model.u);
template.useSteadyState = ~isempty(ar.model.ss_condition);
template.useEvents = ar.config.useEvents && (template.findInputs || template.useSteadyState);
template.steadyState = struct();
if template.useEvents
    for s = 1:length(ar.model.ss_condition)
        template.steadyState(s).source = ar.model.ss_condition(s).src;
        targets = ar.model.ss_condition(s).ssLink;
        if length(targets) == length(ar.model.condition)
            targets = 'all';
            template.steadyState(s).target = 'all';
        else
            targets = mat2str(targets);
            template.steadyState(s).target = targets;
        end
        ssIgnore = ar.model.ss_condition(s).ssIgnore;
        template.steadyState(s).ignoreStates = ar.model.xNames(ssIgnore);
        template.steadyState(s).tStart = ar.model.ss_condition(s).tstart;

        % create the function call for the setup file
        setupCall = sprintf('arSteadyState(1, %i, ''%s'', {%s}, %i);', ...
            template.steadyState(s).source, ...
            targets, ...
            strjoin(template.steadyState(s).ignoreStates, ', '), ...
            template.steadyState(s).tStart);

        template.steadyState(s).setupCall = setupCall;
    end
end

%% custom d2d configs
template.customSettings = arConfigDiff2Default();

%% create condition-observable matrix
if qCondObsMatrix
    template = createCondObsMatrix(template, qPlot);
end

%% save the template
if qSave2File
    [~] = mkdir('RS_Template');
    save(fullfile('RS_Template', 'RS_Template.mat'), 'template');
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function template = mergeTimecourse(template)

oldTimecourse = template.timeCourse;

% merge time-course data according to cLink
condis = unique([oldTimecourse.cLink]);

template.timeCourse = struct();

for idx=1:length(condis)
    c = condis(idx);
    qTC = ([oldTimecourse.cLink]==c);
    cOld = find(qTC, 1);
    template.timeCourse(idx).cLink = c;
    template.timeCourse(idx).dLink = [oldTimecourse(qTC).dLink];
    template.timeCourse(idx).condReplace = oldTimecourse(cOld).condReplace;
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function template = mergeDoseresponse(template)

oldDoseResponse = template.doseResponse;

% create a string of characteristics for each DR
for dr = 1:length(oldDoseResponse)
    response = oldDoseResponse(dr).response_parameter;
    tExp = oldDoseResponse(dr).tExp;
    condRepStr = [oldDoseResponse(dr).condReplaceRest{:}];
    oldDoseResponse(dr).checkString = sprintf('%s_%i_%s', response, tExp, condRepStr);
end

% find unique DRs
checkStrings = {oldDoseResponse.checkString};
[~, drOld, drUnique] = unique(checkStrings, "stable");

% merge DRs
template.doseResponse = struct();
for dr = 1:max(drUnique)
    qDR = (drUnique==dr);
    template.doseResponse(dr).cLink = [oldDoseResponse(qDR).cLink];
    template.doseResponse(dr).dLink = [oldDoseResponse(qDR).dLink];
    template.doseResponse(dr).condReplaceRest = oldDoseResponse(drOld(dr)).condReplaceRest;
    template.doseResponse(dr).response_parameter = oldDoseResponse(drOld(dr)).response_parameter;
    template.doseResponse(dr).values = [oldDoseResponse(qDR).values];
    template.doseResponse(dr).tExp = oldDoseResponse(drOld(dr)).tExp;
    template.doseResponse(dr).nReplica = [oldDoseResponse(qDR).nReplica];
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function template = createCondObsMatrix(template, qPlot)

m = 1;
[allStateSets, ~] = arObsStringRepresent(m, 'all');
uniqStateSets = unique(allStateSets);
nCols = length(uniqStateSets);

nTC = length(template.timeCourse);
nDR = length(template.doseResponse);
nRows = nTC + nDR;

condObsMatrix = zeros(nRows, nCols);

for tc = 1:nTC
    [rowStateSets, ~] = arObsStringRepresent(m, 'data', template.timeCourse(tc).dLink);
    for iCol = 1:nCols
        if ismember(uniqStateSets(iCol), rowStateSets)
            condObsMatrix(tc, iCol) = 1;
        end
    end
end

for dr = 1:nDR
    [rowStateSets, ~] = arObsStringRepresent(m, 'data', template.doseResponse(dr).dLink);
    for iCol = 1:nCols
        if ismember(uniqStateSets(iCol), rowStateSets)
            condObsMatrix(nTC + dr, iCol) = 1;
        end
    end
end

template.condObsMatrix = condObsMatrix;

if qPlot

    figure;
    
    % Create a tiled layout with specified row ratios
    t = tiledlayout(nRows, 1, 'TileSpacing', 'Compact', 'Padding', 'Compact');

    % Plot time-course data
    nexttile([nTC, 1]);
    imagesc(condObsMatrix(1:nTC, :));
    map = [0.8 0.8 0.8      % 0 -> light grey
           0.0 0.5 1.0];    % 1 -> blue
    colormap(map);

    % Ticks & tick labels for the first subplot
    xticks([]);
    yticks(1:nTC);
    set(gca(), 'TickLength', [0,0]);

    % Grid lines for the first subplot
    arrayfun(@(x) xline(x), 0.5:(nCols+0.5));
    arrayfun(@(y) yline(y), 0.5:(nTC+0.5));

    ylabel('time-course');

    % Plot dose-response data
    nexttile([nDR, 1]);
    imagesc(condObsMatrix(nTC+1:end, :));

    % Ticks & tick labels for the second subplot
    xticks(1:nCols);
    yticks(1:(nRows-nTC));
    set(gca(), 'TickLength', [0,0]);

    % Grid lines for the second subplot
    arrayfun(@(x) xline(x), 0.5:(nCols+0.5));
    arrayfun(@(y) yline(y), 0.5:((nRows-nTC)+0.5));

    ylabel('dose-response');

    % Title and x-label for the whole figure
    title(t, 'Condition-Observable Matrix');
    xlabel(t, 'observables');

    % save the figure
    [~] = mkdir('RS_Template');
    savefig(fullfile('RS_Template', 'condObsMatrix.fig'));
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function customSettings = arConfigDiff2Default()
    
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
    'maxsteps', 'maxstepsize', 'nCVRestart', ...
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
%     % {'nCore',                       feature('numCores')}, ...       %   number of available cores
%     % {'nParallel',                   2*feature('numCores')}, ...
%     % {'nMaxThreads',                 64}, ...
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
%     % {'useEvents',                   0}, ...                         %   Use event system
%     % {'useMS',                       0}, ...                         %   Use multiple shooting (DEPRECATED)
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
    
end    
    


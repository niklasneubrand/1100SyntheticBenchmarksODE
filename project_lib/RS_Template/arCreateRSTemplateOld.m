function RSTemplate = arCreateRSTemplateOld(qCondObsMatrix, qPlot, qSave2File, mergeModeDR)

arguments
    qCondObsMatrix (1,1) logical = true
    qPlot (1,1) logical = false
    qSave2File (1,1) logical = true
    mergeModeDR (1,1) string {mustBeMember(mergeModeDR, ["observables", "dataFileName"])} = "observables"
end

global ar  %#ok<*GVMIS>

RSTemplate = struct();

%% name of the project
RSTemplate.originalName = ar.info.name;

%% analyze conditions
condStruct = arModelConditions();
% remove conditions for observables (not needed for RSTemplate)
for ip = length(condStruct.modelReplace):-1:1
    if isfield(ar.model, 'py') && ismember(condStruct.modelReplace{ip, 1}, ar.model.py)
        condStruct.modelReplace(ip, :) = [];
    end
end
for ic = 1:length(condStruct.condReplace)
    for ip = size(condStruct.condReplace{ic},1):-1:1
        if isfield(ar.model, 'py') && ismember(condStruct.condReplace{ic}{ip, 1}, ar.model.py)
            condStruct.condReplace{ic}(ip, :) = [];
        end
    end
end
RSTemplate.condStruct = condStruct;

%% analyze input functions
inputConds = arInputConds(1);
RSTemplate.inputConds = inputConds;

%% analyze data
nData = length(ar.model.data);
RSTemplate.timeCourse = struct([]);
RSTemplate.doseResponse = struct([]);

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
        RSTemplate.timeCourse(tc).cLink = c;
        RSTemplate.timeCourse(tc).dLink = d;
        RSTemplate.timeCourse(tc).condReplace = condStruct.condReplace{c};
        RSTemplate.timeCourse(tc).inputConds = [inputConds(c).u', inputConds(c).fu'];
        
    % dose-response data
    else
        dr = dr + 1;

        % condition and data link(s)
        RSTemplate.doseResponse(dr).cLink = c;
        RSTemplate.doseResponse(dr).dLink = d;

        % response parameter
        response_parameter = ar.model.data(d).response_parameter;
        RSTemplate.doseResponse(dr).response_parameter = response_parameter;

        % get the response variable's value
        qResponse = strcmp(ar.model.data(d).pold, response_parameter);
        RSTemplate.doseResponse(dr).values = double(arSym(ar.model.data(d).fp(qResponse)));

        % add the observable names (make distinction of different DRs easier)
        RSTemplate.doseResponse(dr).yNames = ar.model.data(d).yNames;

        % get the time point(s)
        tExp = ar.model.data(d).tExp;
        RSTemplate.doseResponse(dr).tExp = tExp(1);
        RSTemplate.doseResponse(dr).nReplica = length(tExp);

        % set the replacements for remaining parameters (and inputs)
        condRep = condStruct.condReplace{c};
        qResp = strcmp(condRep(:, 1), response_parameter);
        condRep = condRep(~qResp, :);
        RSTemplate.doseResponse(dr).condReplaceRest = condRep;
        RSTemplate.doseResponse(dr).inputConds = [inputConds(c).u', inputConds(c).fu'];

    end
end

% merge data in a meaningful way
RSTemplate = mergeTimecourse(RSTemplate);
RSTemplate = mergeDoseresponse(RSTemplate, mergeModeDR);
RSTemplate.nTC = length(RSTemplate.timeCourse);
RSTemplate.nDR = length(RSTemplate.doseResponse);
RSTemplate.nExp = RSTemplate.nTC + RSTemplate.nDR;

% add plot links
for tc = 1:RSTemplate.nTC
    pLink = arFindPlot(ar, {ar.model.data(RSTemplate.timeCourse(tc).dLink).name});
    RSTemplate.timeCourse(tc).pLink = pLink;
end
for dr = 1:RSTemplate.nDR
    pLink = arFindPlot(ar, {ar.model.data(RSTemplate.doseResponse(dr).dLink).name});
    RSTemplate.doseResponse(dr).pLink = pLink;
end

%% analyze steady states and events
RSTemplate.findInputs = ~isempty(ar.model.u);
RSTemplate.useSteadyState = isfield(ar.model, 'ss_condition');
RSTemplate.useEvents = ar.config.useEvents && (RSTemplate.findInputs || RSTemplate.useSteadyState);
RSTemplate.steadyState = struct([]);
if RSTemplate.useSteadyState
    for s = 1:length(ar.model.ss_condition)
        
        % c index of source in original ar struct
        srcCond = ar.model.ss_condition(s).src;
        
        % identify the corresponding experiment
        % start with tiome courses
        srcTC = find([RSTemplate.timeCourse(:).cLink]==srcCond);
        if length(srcTC) == 1
            % exactly one TC found -> we are done
            srcFind = sprintf('arFindCondition(ar, ''TC%03d'')', srcTC);
        elseif length(srcTC) > 1
            warning('Multiple TC share a condition. This is not intended.')
        elseif isempty(srcTC)
            % the source is not a time course
            % search the dose response experiments
            for dr = 1:RSTemplate.nDR
                srcDR = find([RSTemplate.doseResponse(dr).cLink]==srcCond);
                if length(srcDR) == 1
                    % exactly one DR found -> we are done
                    response_parameter = RSTemplate.doseResponse(dr).response_parameter;
                    value = RSTemplate.doseResponse(dr).values(srcDR);
                    srcFind = sprintf('arFindCondition(ar, ''DR%03d'', ''%s'', %i)', dr, response_parameter, value);
                    break
                elseif length(srcDR) > 1
                    warning('Multiple DR share a condition. This is not intended.')
                end
            end
        end
        RSTemplate.steadyState(s).sourceFind = srcFind;

        % set the target conditions
        targets = ar.model.ss_condition(s).ssLink;
        if length(targets) == length(ar.model.condition)
            targets = 'all';
            RSTemplate.steadyState(s).target = 'all';
        else
            targets = mat2str(targets);
            RSTemplate.steadyState(s).target = targets;
        end

        % set the remaining input arguments for the function call
        ssIgnore = ar.model.ss_condition(s).ssIgnore;
        RSTemplate.steadyState(s).ignoreStates = ar.model.xNames(ssIgnore);
        RSTemplate.steadyState(s).tStart = ar.model.ss_condition(s).tstart;

        % create the function call for the setup file
        setupCall = sprintf('arSteadyState(1, %s, ''%s'', {%s}, %i);', ...
            RSTemplate.steadyState(s).sourceFind, ...
            targets, ...
            strjoin(RSTemplate.steadyState(s).ignoreStates, ', '), ...
            RSTemplate.steadyState(s).tStart);

        RSTemplate.steadyState(s).setupCall = setupCall;
    end
end

%% custom d2d configs
RSTemplate.customSettings = arConfigDiff2Default();

%% create condition-observable matrix
if qCondObsMatrix
    RSTemplate = createCondObsMatrix(RSTemplate, qPlot);
end

%% sort the fields and subfields
RSTemplate = sortStruct(RSTemplate);

%% save the RSTemplate
if qSave2File
    [~] = mkdir('RSTemplate');
    save(fullfile('RSTemplate', 'RSTemplate.mat'), 'RSTemplate');
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function RSTemplate = mergeTimecourse(RSTemplate)

% return if there are no time course conditions
if isempty(RSTemplate.timeCourse)
    return
end

oldTimecourse = RSTemplate.timeCourse;

% merge time-course data according to cLink
condis = unique([oldTimecourse.cLink]);

RSTemplate.timeCourse = struct();

for idx=1:length(condis)
    c = condis(idx);
    qTC = ([oldTimecourse.cLink]==c);
    cOld = find(qTC, 1);
    RSTemplate.timeCourse(idx).cLink = c;
    RSTemplate.timeCourse(idx).dLink = [oldTimecourse(qTC).dLink];
    RSTemplate.timeCourse(idx).condReplace = oldTimecourse(cOld).condReplace;
    RSTemplate.timeCourse(idx).inputConds = oldTimecourse(cOld).inputConds;
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function RSTemplate = mergeDoseresponse(RSTemplate, mergeMode)

arguments
    RSTemplate struct
    mergeMode (1,1) string = "observables"
end

global ar

% return if there are no dose response conditions
if isempty(RSTemplate.doseResponse)
    return
end

oldDoseResponse = RSTemplate.doseResponse;

% create a string of characteristics for each DR
for dr = 1:length(oldDoseResponse)
    switch mergeMode
        case "observables"
            % match conditions by conditions and observables
            % potentially, combine data files with different names but same exp. conds.
            response = oldDoseResponse(dr).response_parameter;
            tExp = oldDoseResponse(dr).tExp;
            obsNames = strjoin(oldDoseResponse(dr).yNames, '-');
            condRepStr = [oldDoseResponse(dr).condReplaceRest{:}];
            inputsRepStr = [oldDoseResponse(dr).inputConds{:}];
            oldDoseResponse(dr).checkString = sprintf("%s_%i_%s_%s_%s", ...
            response, tExp, obsNames, condRepStr, inputsRepStr);
        case "dataFileName"
            % match conditions by data file name
            % this makes sense for the realistic benchmarks (where the file names are auto-generated)
            d = oldDoseResponse(dr).dLink;
            oldDoseResponse(dr).checkString = string(ar.model.data(d).name);
    end
    
end

% find unique DRs
checkStrings = [oldDoseResponse.checkString];
[~, drOld, drUnique] = unique(checkStrings, "stable");

% merge DRs
RSTemplate.doseResponse = struct();
for dr = 1:max(drUnique)
    qDR = (drUnique==dr);
    RSTemplate.doseResponse(dr).cLink = [oldDoseResponse(qDR).cLink];
    RSTemplate.doseResponse(dr).dLink = [oldDoseResponse(qDR).dLink];
    RSTemplate.doseResponse(dr).condReplaceRest = oldDoseResponse(drOld(dr)).condReplaceRest;
    RSTemplate.doseResponse(dr).inputConds = oldDoseResponse(drOld(dr)).inputConds;
    RSTemplate.doseResponse(dr).response_parameter = oldDoseResponse(drOld(dr)).response_parameter;
    RSTemplate.doseResponse(dr).tExp = oldDoseResponse(drOld(dr)).tExp;

    % merge values and replicas horzontally
    allValues = [oldDoseResponse(qDR).values];
    nReplica = [oldDoseResponse(qDR).nReplica];
    [values, ~, iOld] = unique(allValues, "stable");
    RSTemplate.doseResponse(dr).values = values;
    for iv = 1:max(iOld)
        qOld = (iOld==iv);
        RSTemplate.doseResponse(dr).nReplica(iv) = sum(nReplica(qOld));
    end
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function RSTemplate = createCondObsMatrix(RSTemplate, qPlot)

m = 1;
[allStateSets, ~] = arObsStringRepresent(m, 'allExpData');
uniqStateSets = unique(allStateSets);
nCols = length(uniqStateSets);

nTC = length(RSTemplate.timeCourse);
nDR = length(RSTemplate.doseResponse);
nRows = nTC + nDR;

condObsMatrix = zeros(nRows, nCols);

for tc = 1:nTC
    [rowStateSets, ~] = arObsStringRepresent(m, 'expData', RSTemplate.timeCourse(tc).dLink);
    if isempty(rowStateSets)
        continue
    end
    for iCol = 1:nCols
        if ismember(uniqStateSets(iCol), rowStateSets)
            condObsMatrix(tc, iCol) = 1;
        end
    end
end

for dr = 1:nDR
    [rowStateSets, ~] = arObsStringRepresent(m, 'expData', RSTemplate.doseResponse(dr).dLink);
    if isempty(rowStateSets)
        continue
    end
    for iCol = 1:nCols
        if ismember(uniqStateSets(iCol), rowStateSets)
            condObsMatrix(nTC + dr, iCol) = 1;
        end
    end
end

% sort the columns
[~, sortIdx] = sort(sum(condObsMatrix, 1), 'descend');
condObsMatrix = condObsMatrix(:, sortIdx);
uniqStateSets = uniqStateSets(sortIdx);

RSTemplate.condObsMatrix = condObsMatrix;
RSTemplate.observedStateSets = uniqStateSets;

if qPlot

    figure;
    
    % Create a tiled layout with specified row ratios
    t = tiledlayout(nRows, 1, 'TileSpacing', 'Compact', 'Padding', 'Compact');
    
    % Plot time-course data
    if nTC >0
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
    end

    % Plot dose-response data
    if nDR > 0
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
    end

    % Title and x-label for the whole figure
    title(t, 'Condition-Observable Matrix');
    xlabel(t, 'observables');

    % save the figure
    [~] = mkdir('RSTemplate');
    savefig(fullfile('RSTemplate', 'condObsMatrix.fig'));
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
    


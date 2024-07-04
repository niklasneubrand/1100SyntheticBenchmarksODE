function arNewRealisticDesign(projectName, options)

% TODO:
% - create arRealisticConds (optional)
% - improve arRealisticTimesRTF (optional)
% - use switches instead of booleans for qSet*, e.g.
%   'default', 'simulate', name of a file to load

arguments
    projectName (1,:) char
    options.loadPattern (1,:) char = 'normal'
    options.qLogObs (1,1) logical = true
    options.qShareObsParams (1,1) logical = false
    options.qSetConds (1,1) logical = true
    options.qSetPars (1,1) logical = true
    options.qSetTime (1,1) logical = true
    options.qSetData (1,1) logical = true
    options.rngSeed (1,:) = 'shuffle'    
end

global ar  %#ok<*GVMIS>

%% Only allow for problems witha  single model.def file!!
if length(ar.model) > 1
    error('Only one model.def file allowed for RS pipeline.')
end

%% Setup the random number generator
if strcmp(options.rngSeed, 'shuffle')
    rng('shuffle')
    options.rngSeed = randi(2^32-1);
end
rng(options.rngSeed);

%% save the options for reproducibility
projectPath = fullfile(pwd(), 'RealisticSimulation', projectName);
mkdir(fullfile(projectPath, 'Auxillary'));
save(fullfile(projectPath, 'Auxillary', 'options_RS.mat'), 'options');

%% Load benchmark model
if options.loadPattern == "None"
    if isfield(ar, 'model')
        arFprintf(1, 'Use model from workspace.\n')
    else
        error('No model loaded. Please load a model or specify a load pattern.')
    end
else
    arFprintf(1, 'Load latest model with pattern "%s".\n', options.loadPattern)
    modelLoaded = arLoadLatest(options.loadPattern);
    if modelLoaded
        arFprintf(1, 'Model loaded sucessfully.\n')
    else
        error('No model found for pattern "%s".\n', options.loadPattern)
    end
end

% update "ar.model.path"
% it is set incorrectly if model folder was moved after compilation
ar.model.path = fullfile(pwd(), 'Models');

%% Create new project folder
arCreateRealisticProject(projectName, projectPath, options.rngSeed);

%% Modify the model parameters and bounds
if options.qSetPars
    % multiply parameters by random factor in [1/2, 2]
    newParams = arRealisticParams(2, 'log-uniform', options.rngSeed);
    ar.p = round(newParams, 3, 'significant');
    arFprintf(1, 'Parameters randomized realistically.\n')
else
    % use the parameters from the loaded model
    arFprintf(1, 'Use parameters from loaded model.\n')  
end
% set bounds to +-3 orders of magnitude around the parameters
arSetParsBounds(3);

%% Set Conditions/Observables
if options.qSetConds
        condStruct = arModelConditions();
        obsStruct = arDrawObservables(1, options.rngSeed, options.qLogObs);
        arWriteDataDefFiles(projectName, projectPath, options.rngSeed, ...
                            obsStruct, condStruct)
        auxFilesDir = fullfile(projectPath, "Auxillary");
        save(fullfile(auxFilesDir, "condStruct"), "condStruct");
        save(fullfile(auxFilesDir, sprintf("obsStruct_%s", projectName)), "obsStruct");
else
    % use data *.def files from loaded model
    % -> exact same observables
    % -> also covers the data conditions (not included in the simulations)
    % for m = 1:length(ar.model)
    %     for d = 1:length(ar.model(m).data)
    %         datafile = fullfile(ar.model(m).data(d).path, ...
    %                             sprintf('%s.def', ar.model(m).data(d).name));
    %         copyfile(datafile, fullfile(projectPath, 'Data'));
    %     end
    % end
end

resultsFolder = sprintf('%s__newParams', projectName);
arSave(resultsFolder, false, false);
fclose('all'); % close all files (resolves 'unknown error' of 'movefile')
movefile(fullfile('Results', resultsFolder), ...
         fullfile(projectPath, 'Results', resultsFolder));


%% Set up the new model
oldPath = cd(projectPath);

try
    fprintf('Compiling the new model structure.\n')
    SetupAuxillary;
    
    %% Use RTF fits to set realistic time points
    if options.qSetTime
        arRealisticTimesRTF(options.rngSeed);
        arSave(sprintf('%s__newTimes', projectName), false, false)
    else
        % use the time points from the loaded model
    end
    
    %% Simulate realistic data
    if options.qSetData
        arRealisticData(projectName, options.rngSeed);
    else
        % use the data from the loaded model
    end

    fprintf('Compiling the final realistically simulated model with data.\n')
    Setup;

    % Export the model to PEtab
    arExportPEtab();

    % Plot the observables
    arPlotFullPage();

    % clean up the project folder -> remove auxillary files
    movefile("SetupAuxillary.m", fullfile("Auxillary", "SetupAuxillary.m"));
    delete(fullfile("Models", "TransientFunction.def"));

    cd(oldPath);

catch ME
    cd(oldPath);
    warning('Error while setting up the new model.')
    rethrow(ME)
end

end
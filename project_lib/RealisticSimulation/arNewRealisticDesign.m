function arNewRealisticDesign(projectName, options)

arguments
    projectName (1,:) char
    options.loadPattern (1,:) char = 'normal'
    options.inclDynRatio (1,1) double = 0
    options.replaceConstObs (1,:) char = 'all'
    options.qLogObs (1,1) logical = true
    options.qShareObsParams (1,1) logical = false
    options.qSetPars (1,1) logical = true
    options.includeCustomSettings (1,1) logical = false
    options.rngSeed (1,:) = 'shuffle'
    options.seedStep (1,:) double = 1000
end

global ar  %#ok<*GVMIS>

%% initilize d2d
arInit();

%% Setup the random number generator
if strcmp(options.rngSeed, 'shuffle')
    rng('shuffle')
    options.rngSeed = randi(2^32-1);
end
rng(options.rngSeed);

%% save the options for reproducibility
projectPath = fullfile(pwd(), 'RealisticSimulation', projectName);
mkdir(fullfile(projectPath, 'Auxillary'));
save(fullfile(projectPath, 'Auxillary', sprintf('options_%s', projectName)), 'options');

%% Load benchmark model
arFprintf(1, 'Load latest model with pattern "%s".\n', options.loadPattern)
modelLoaded = arLoadLatest(options.loadPattern);
if modelLoaded
    arFprintf(1, 'Model loaded sucessfully.\n')
else
    error('No model found for pattern "%s".\n', options.loadPattern)
end

% Only allow for problems witha single model.def file!!
if length(ar.model) > 1
    error('Only one model.def file allowed for RS pipeline.')
end

% update "ar.model.path"
% it is set incorrectly if model folder was moved after compilation
ar.model.path = fullfile(pwd(), 'Models');

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
auxFilesDir = fullfile(projectPath, "Auxillary");
try
    load(fullfile("RSTemplate", "RSTemplate.mat"), "RSTemplate");
    if ~isfield(RSTemplate, 'condObsMatrix')
        error('RSTemplate is not complete. Calculate it again.')
    end
catch
    RSTemplate = arCreateRSTemplate(true, true, true);
end
obsStruct = arDrawObservables(1, options.rngSeed, ...
    options.inclDynRatio, options.replaceConstObs, options.qLogObs, RSTemplate);
arWriteDataDefFiles(projectName, projectPath, options.rngSeed, ...
    obsStruct, RSTemplate, 'auxillary');
arWriteAuxillaryData(projectName, projectPath, obsStruct, RSTemplate);

save(fullfile(auxFilesDir, "RSTemplate_BaseModel"), "RSTemplate");
save(fullfile(auxFilesDir, sprintf("obsStruct_%s", projectName)), "obsStruct");

%% Create new project folder
arCreateRealisticProject(projectName, projectPath, options.rngSeed, options.includeCustomSettings, RSTemplate);

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
    
    %% Generate realistic time points
    arRealisticTimesRTF(options.rngSeed);
    arRealisticTimesDR(options.rngSeed, RSTemplate);
    arSave(sprintf('%s__newTimes', projectName), false, false)

    % update the error models based on new time points
    load(fullfile(auxFilesDir, sprintf("obsStruct_%s", projectName)), "obsStruct");
    obsStruct = arUpdateObsParams(1, obsStruct);
    arWriteDataDefFiles(projectName, projectPath, options.rngSeed, ...
                        obsStruct, RSTemplate)
    save(fullfile(auxFilesDir, sprintf("obsStruct_%s", projectName)), "obsStruct");

    %% Simulate realistic data
    arRealisticData(projectName, options.rngSeed);

    fprintf('Compiling the final realistically simulated model with data.\n')
    Setup;

    % Export the model to PEtab
    arExportPEtab();

    % Plot the observables
    arPlot();
    arPlotFullPage(); close all;

    % clean up the project folder -> remove auxillary files
    movefile("SetupAuxillary.m", fullfile("Auxillary", "SetupAuxillary.m"));
    movefile(fullfile('Data', '*_auxillary.*'), 'Auxillary')
    delete(fullfile("Models", "TransientFunction.def"));

    cd(oldPath);

catch ME
    cd(oldPath);
    warning('Error while setting up the new model.')
    rethrow(ME)
end

end
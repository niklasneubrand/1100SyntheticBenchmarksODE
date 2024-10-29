function arNewRealisticDesign(projectName, options)

arguments
    projectName (1,:) char
    % base model
    options.loadPattern (1,:) char
    options.includeCustomSettings (1,1) logical
    options.calculateRSTemplate (1,1) logical
    % randomization
    options.rngSeed (1,:)
    options.seedStep (1,1) double
    options.qSetPars (1,1) logical
    % observable options
    options.inclDynRatio (1,1) double
    options.replaceConstObs (1,:) char
    options.qLogObs (1,1) logical
end

% set default options
options = arSetDefaultRSOptions(options);

% if seed is 'shuffle', draw a random seed and save it
% this ensures both randomnes and reproducibility
if ischar(options.rngSeed) && strcmp(options.rngSeed, 'shuffle')
    rng('shuffle');
    options.rngSeed = randi(2^32-1);
end
rng(options.rngSeed);

%% initilize d2d
global ar  %#ok<*GVMIS>
arInit();

%% save the options for reproducibility
projectPath = fullfile(pwd(), 'RealisticSimulation', projectName);
[~] = mkdir(fullfile(projectPath, 'Auxillary'));
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

% set parallel threads correctly (in case the model was compiled on another IMBI server)
arSetParallelThreads();

%% Modify the model parameters and bounds
if options.qSetPars
    arSetRealisticParams(projectPath, options.rngSeed);
else
    % use the parameters from the loaded model
    arFprintf(1, 'Use parameters from loaded model.\n')
end

%% Set Conditions/Observables
auxFilesDir = fullfile(projectPath, "Auxillary");
if options.calculateRSTemplate
    RSTemplate = arCreateRSTemplate(true, true, true);
else
    try
        load(fullfile("RSTemplate", "RSTemplate.mat"), "RSTemplate");
        if ~isfield(RSTemplate, 'condObsMatrix')
            error('RSTemplate is not complete. Calculate it again.')
        end
    catch
        warning('RSTemplate not found or incomplete. Calculating it again.')
        RSTemplate = arCreateRSTemplate(true, true, true);
    end
end
[obsStruct, RSTemplate] = arDrawObservables(1, options, RSTemplate);
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

    %% fix bug with nThreads
    if isfield(ar.config, 'nThreads') && (ar.config.nThreads > ar.config.nMaxThreads)
        % limit the number of threads to the maximum allowed
        arSetParallelThreads(ar.config.nMaxThreads)
    end
    
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
    try
        arExportPEtab();
    catch ME
        warning('Error while exporting the model to PEtab.')
        display(getReport(ME))
    end

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
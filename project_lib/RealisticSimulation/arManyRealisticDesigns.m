function arManyRealisticDesigns(iSimus, options)

arguments
    iSimus (1,:) double {mustBeInteger, mustBePositive}
    options.loadPattern (1,:) char = 'Base'
    options.rngSeed (1,:) = 'shuffle'
    options.qLogObs (1,1) logical = false
    options.qSetConds (1,1) logical = true
    options.qSetPars (1,1) logical = true
    options.qSetTime (1,1) logical = true
    options.qSetData (1,1) logical = true  
end

global ar

%% compile the base model (if necessary)
loadStatus = arLoadLatest(options.loadPattern);
if ~loadStatus
    arFprintf(1, "Compiling the base model...\n");
    Setup;
%   arFitLHS(100);
    arSave(options.loadPattern);
end
% make sure the paths are set correctly
ar.info.path = pwd();
for m = 1:length(ar.model)
    ar.model(m).path = fullfile(pwd(), 'Models');
end

%% extract the condition-observable structure
arCondObsStructure()

% set the random seed
if ischar(options.rngSeed) && strcmp(options.rngSeed, 'shuffle')
    rng('shuffle');
    startSeed = randi(2^32-1);
else
    startSeed = options.rngSeed;
end

% nameformat for the projects
nSimus = max(iSimus); 
nameFmt = sprintf('%s_Realistic%%0%id', ar.info.name, floor(log10(nSimus))+1);

%% run the simulations
for iSimu = iSimus

    projectName = sprintf(nameFmt, iSimu);

    % initialize the log file
    projectDir = fullfile(pwd(), 'RealisticSimulation', projectName);
    mkdir(projectDir);
    logFile = fullfile(projectDir, sprintf([nameFmt '.log'], iSimu));
    diary(logFile);

    options.rngSeed = startSeed + iSimu - 1;

    % save the options
    mkdir(fullfile(projectDir, 'Auxillary'));
    save(fullfile(projectDir, 'Auxillary', 'RealisticDesignOptions.mat'), 'options');

    % reshape the options for handing them to "arNewRealisticDesign"
    optionNames = fieldnames(options);
    passOptions = cell(1, 2*length(optionNames));
    for i = 1:length(optionNames)
        passOptions{2*i-1} = optionNames{i};
        passOptions{2*i} = options.(optionNames{i});
    end

    % run the realistic simulation
    try
        arNewRealisticDesign(projectName, passOptions{:});
    catch ME
        report = getReport(ME);
        warning(report);
    end

    diary("off");

end

end
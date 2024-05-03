function arManyRealisticDesigns(iSimus, options)

arguments
    iSimus (1,:) double {mustBeInteger, mustBePositive}
    options.loadPattern (1,:) char = 'None'
    options.rngSeed (1,:) = 'shuffle'
    options.qLogObs (1,1) logical = false
    options.qSetConds (1,1) logical = true
    options.qSetPars (1,1) logical = true
    options.qSetTime (1,1) logical = true
    options.qSetData (1,1) logical = true  
end

global ar

%% compile the base model (if necessary)
lastwarn('', '');
arLoadLatest(options.loadPattern);
warnMsg = lastwarn();
if ~isempty(warnMsg)
    arFprintf(1, "Compiling the base model...\n");
    Setup;
    arFitLHS(100);
    arSave(options.loadPattern);
end
% make sure the paths are set correctly
ar.info.path = pwd();
ar.model.path = fullfile(pwd(), 'Models');

%% extract the condition-observable structure
arCondObsStructure()

% nameformat for the projects
nSimus = max(iSimus); 
nameFmt = sprintf('Realistic%%0%id', floor(log10(nSimus))+1);

% set the random seed
if ischar(options.rngSeed) && strcmp(options.rngSeed, 'shuffle')
    rng('shuffle');
    startSeed = randi(2^32-1);
else
    startSeed = options.rngSeed;
end

%% run the simulations
for iSimu = iSimus

    projectName = sprintf(nameFmt, iSimu);

    % initialize the log file
    projectDir = fullfile(pwd(), 'RealisticSimulation', projectName);
    mkdir(projectDir);
    logFile = fullfile(projectDir, sprintf('Realistic%d.log', iSimu));
    diary(logFile);

    options.rngSeed = startSeed + iSimu - 1;

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
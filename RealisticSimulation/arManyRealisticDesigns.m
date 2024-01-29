function arManyRealisticDesigns(nSimus, options)

arguments
    nSimus (1,1) double {mustBeInteger, mustBePositive}
    options.loadPattern (1,:) char = 'None'
    options.qLogObs (1,1) logical = false
    options.qSetConds (1,1) logical = true
    options.qSetPars (1,1) logical = true
    options.qSetTime (1,1) logical = true
    options.qSetData (1,1) logical = true  
end

%% compile the base model (if necessary)
lastwarn('', '');
arLoadLatest(options.loadPattern);
warnMsg = lastwarn();
if ~isempty(warnMsg)
    arFprintf(1, "Compiling the base model...\n");
    Setup;
    % arSave(loadPattern);
end
% make sure the paths are set correctly
ar.info.path = pwd();
ar.model.path = fullfile(pwd(), 'Models');

%% extract the condition-observable structure
arCondObsStructure()

nameFmt = sprintf('Realistic%%0%id', floor(log10(nSimus))+1);

%% run the simulations
for iSimu = 1:nSimus

    projectName = sprintf(nameFmt, iSimu);

    % initialize the log file
    projectDir = fullfile(pwd(), 'RealisticSimulation', projectName);
    mkdir(projectDir);
    logFile = fullfile(projectDir, sprintf('Realistic%d.log', iSimu));
    diary(logFile);

    options.rngSeed = iSimu;

    % reshape the options for handing them to "arNewrealisticDesign"
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
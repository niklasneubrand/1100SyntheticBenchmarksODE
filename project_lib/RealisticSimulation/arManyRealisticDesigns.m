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

% set the random seed
if ischar(options.rngSeed) && strcmp(options.rngSeed, 'shuffle')
    rng('shuffle');
    startSeed = randi(2^32-1);
else
    startSeed = options.rngSeed;
end

% save the input arguments
infoDir = fullfile(pwd(), 'RealisticSimulation', 'InfoManySimus');
mkdir(infoDir);
startTime = datetime('now', 'Format', 'yyyy-MM-dd_HH-mm-ss');
save(fullfile(infoDir, ['arManyRealisticDesigns__Inputs__' startTime]), 'iSimus', 'options');

%% compile the base model (if necessary)
loadStatus = arLoadLatest(options.loadPattern);
if ~loadStatus
    arFprintf(1, "Compiling the base model...\n");
    % find setup file and execute it
    files = {dir().name};
    setupFile = files(~cellfun(@isempty, regexpi(files, '.*setup.*\.m$')));
    if isempty(setupFile)
        error('No setup file found.')
    elseif length(setupFile) > 1
        error('Multiple setup files found.')
    else
        setupFile = setupFile{1};
    end
    eval(setupFile(1:end-2));
    arSave(options.loadPattern);
end
% make sure the paths are set correctly
ar.info.path = pwd();
for m = 1:length(ar.model)
    ar.model(m).path = fullfile(pwd(), 'Models');
end

%% extract the condition-observable structure
arCondObsStructure()

% nameformat for the projects
nSimus = max(iSimus);
nameFmt = sprintf('%s_Realistic%%0%id', ar.info.name, floor(log10(nSimus))+1);

% collect statistics about simulation success
simuReport = struct();
simuReport.projectName = arrayfun(@(x) sprintf(nameFmt, x), ...
                                  iSimus, 'UniformOutput', false);
simuReport.success = false(size(iSimus));
simuReport.error = cell(size(iSimus));
simuReport.startTime = NaT(size(iSimus));
simuReport.endTime = NaT(size(iSimus));
simuReport.duration = NaT(size(iSimus));


%% run the simulations
for iSimu = iSimus

    simuReport.startTime(iSimu) = datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss');

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
        simuReport.success(iSimu) = true;
    catch ME
        report = getReport(ME);
        warning(report);
        simuReport.error{iSimu} = report;
    end

    diary("off");

    simuReport.endTime(iSimu) = datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss');
    simuReport.duration(iSimu) = simuReport.endTime(iSimu) - simuReport.startTime(iSimu);
end

% save the simulation report
simuReport = struct2table(simuReport);
writetable(simuReport, fullfile(infoDir, ['arManyRealisticDesigns__Report__' startTime '.csv']));

end
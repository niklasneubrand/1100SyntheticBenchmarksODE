function arManyRealisticDesigns(iSimus, options)

arguments
    iSimus (1,:) double {mustBeInteger, mustBePositive}
    % base model
    options.loadPattern (1,:) char
    options.includeCustomSettings (1,1) logical
    % randomization
    options.rngSeed (1,:)
    options.seedStep (1,1) double
    options.qSetPars (1,1) logical
    % observable options
    options.inclDynRatio (1,1) double
    options.replaceConstObs (1,:) char
    options.qLogObs (1,1) logical
end

global ar

% set default options
options = arSetDefaultRSOptions(options);

% if seed is 'shuffle', draw a random seed and save it
% this ensures both randomnes and reproducibility
if ischar(options.rngSeed) && strcmp(options.rngSeed, 'shuffle')
    rng('shuffle');
    options.rngSeed = randi(2^32-1);
end
% save the start seed for later reference (rngSeed will be different for each simulation)
startSeed = options.rngSeed;
seedStep = options.seedStep;

% save the input arguments
infoDir = fullfile(pwd(), 'RealisticSimulation', '0_info_manyRS');
[~] = mkdir(infoDir);
save(fullfile(infoDir, sprintf('options_manyRS_%i', startSeed)), 'options');

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

% nameformat for the projects
% nDigits = floor(log10(max(iSimus)))+1;
nDigits = 2;
baseNameShort = split(ar.info.name, '_');
baseNameShort = baseNameShort{1};
nameFmt = sprintf('%s_RS%%0%id', baseNameShort, nDigits);

nSimus = length(iSimus);

%% run the simulations
for idx = 1:nSimus
    % explanation of indices:
    % idx starts at 1 and counts the number of simulations
    % iSimus can be any numbers proved by the user (e.g. 5:10)
    iSimu = iSimus(idx);   

    tStart = datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss');

    projectName = string(sprintf(nameFmt, iSimu));

    % initialize the log file
    projectDir = fullfile(pwd(), 'RealisticSimulation', projectName);
    [~] = mkdir(projectDir);
    logFile = fullfile(projectDir, sprintf([nameFmt '.log'], iSimu));
    diary(logFile);

    options.rngSeed = startSeed + seedStep*(iSimu);

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
        success = true;
        error = "";
    catch ME
        report = getReport(ME);
        warning(report);
        % remove line breaks from error message (for csv file)
        success = false;
        report = strrep(report, newline, ' ');
        error = string(report);
    end

    diary("off");
    
    tEnd = datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss');
    runtime = tEnd - tStart;
    startTime = string(tStart);
    endTime = string(tEnd);
    duration = string(runtime);

    % save the simulation report
    simuReport = table(projectName, success, startTime, endTime, duration, error);
    writetable(simuReport, fullfile(infoDir, sprintf('report_manyRS_%010i.csv', startSeed)), "WriteMode", "append");
end

end
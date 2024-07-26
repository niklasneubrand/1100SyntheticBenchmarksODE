function arManyRealisticDesigns(iSimus, options)

arguments
    iSimus (1,:) double {mustBeInteger, mustBePositive}
    options.loadPattern (1,:) char = 'normal'
    options.rngSeed (1,:) = 'shuffle'
    options.qLogObs (1,1) logical = true
    options.qShareObsParams (1,1) logical = false
    options.qSetConds (1,1) logical = true
    options.qSetPars (1,1) logical = true
    options.qSetTime (1,1) logical = true
    options.qSetData (1,1) logical = true  
    options.includeCustomSettings (1,1) logical = false
end

global ar

% set the random seed
if ischar(options.rngSeed) && strcmp(options.rngSeed, 'shuffle')
    rng('shuffle');
    options.rngSeed = randi(2^32-1);
end
% save the start seed for later reference (rngSeed will be different for each simulation)
startSeed = options.rngSeed;

% save the input arguments
infoDir = fullfile(pwd(), 'RealisticSimulation', '0_info_manyRS');
mkdir(infoDir);
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

%% extract the condition-observable structure
arCondObsStructure()

% nameformat for the projects
% nDigits = floor(log10(max(iSimus)))+1;
nDigits = 2;
baseNameShort = split(ar.info.name, '_');
baseNameShort = baseNameShort{1};
nameFmt = sprintf('%s_RS%%0%id', baseNameShort, nDigits);

% collect statistics about simulation success
projectNames = arrayfun(@(x) sprintf(nameFmt, x), ...
    iSimus(:), 'UniformOutput', false);
nSimus = length(iSimus);
success = false(nSimus, 1);
error = cell(nSimus, 1);
startTime = cell(nSimus, 1);
endTime = cell(nSimus, 1);
duration = cell(nSimus, 1);

%% run the simulations
for idx = 1:nSimus
    % explanation of indices:
    % idx starts at 1 and counts the number of simulations
    % iSimus can be any numbers proved by the user (e.g. 5:10)
    iSimu = iSimus(idx);   

    tStart = datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss');

    projectName = sprintf(nameFmt, iSimu);

    % initialize the log file
    projectDir = fullfile(pwd(), 'RealisticSimulation', projectName);
    mkdir(projectDir);
    logFile = fullfile(projectDir, sprintf([nameFmt '.log'], iSimu));
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
        success(idx) = true;
        error{idx} = '';
    catch ME
        report = getReport(ME);
        warning(report);
        % remove line breaks from error message (for csv file)
        report = strrep(report, newline, ' ');
        error{idx} = report;
    end

    diary("off");
    
    tEnd = datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss');
    runtime = tEnd - tStart;
    startTime{idx} = char(tStart);
    endTime{idx} = char(tEnd);
    duration{idx} = char(runtime);
end

% save the simulation report
simuReport = table(projectNames, success, startTime, endTime, duration, error);
writetable(simuReport, fullfile(infoDir, sprintf('report_manyRS_%i.csv', startSeed)), "WriteMode", "append");

end
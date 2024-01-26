function arManyRealisticDesigns(nSimus, loadPattern)

arguments
    nSimus (1,1) double {mustBeInteger, mustBePositive}
    loadPattern (1,:) char
end

%% compile the base model (if necessary)
lastwarn('', '');
arLoadLatest(loadPattern);
warnMsg = lastwarn();
if ~isempty(warnMsg)
    arFprintf(1, "Compiling the base model...\n");
    Setup;
    % arSave(loadPattern);
end

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

    % run the realistic simulation
    try
        arNewRealisticDesign(projectName, 'loadPattern', loadPattern, 'rngSeed', iSimu);
    catch ME
        warning(ME.message);
    end

    diary("off");

end

end
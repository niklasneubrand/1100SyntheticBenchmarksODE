% Initialize the realistic simulations package
realDir = fullfile(pwd(), '..', '..');
startDir = cd(realDir);
initRealisticBenchmarks;
cd(startDir);

% Get project folders from both template and synthetic sources
fast2Folder = fullfile(realDir, 'RS_IMBI', 'fast2_V2');
slow2Folder = fullfile(realDir, 'RS_IMBI', 'slow2_V2');
templateFolders = arListD2DProjects({fast2Folder, slow2Folder}, 'subfolders');

rsFolders = fullfile(realDir, 'SyntheticBenchmarks');
syntheticFolders = arListD2DProjects(rsFolders, 'subsubfolders');

% Combine all folders into one list
d2dProjectFolders = [templateFolders; syntheticFolders];

% Initialize result table
allIdentifyResults = table();

% Process all projects in one loop
for i = 1:length(d2dProjectFolders)
    subDir = d2dProjectFolders{i};
    [parentDir, projectName] = fileparts(subDir);
    [~, templateName] = fileparts(parentDir); % not currently used
    fprintf('Processing project %s:\t', projectName);

    % Construct the expected results file path
    resultsName = sprintf('resultsIdentifyLocal__%s.mat', projectName);
    resultsFile = fullfile(subDir, resultsName);

    if ~isfile(resultsFile)
        fprintf("results file %s not found\n", resultsName);
        continue
    end

    % Load and append results
    try
        load(resultsFile, 'resultsTable');
        allIdentifyResults = [allIdentifyResults; resultsTable]; %#ok<AGROW>
        fprintf("done\n");
    catch ME
        fprintf("error: %s\n", ME.message);
        continue
    end
end

% Save combined results
cd(startDir);
outputName = sprintf('allIdentifyResults_%s.mat', 'V2_2');
save(outputName, 'allIdentifyResults');

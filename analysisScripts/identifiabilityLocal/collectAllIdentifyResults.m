% collect all results of the local identifiability analysis
% this script has to be called when all workers are finished

%%Options
saveName = 'resultsIdentifyLocal';

% initialize the realistic simulations package
realDir = fullfile(pwd(), '..', '..');
startDir = cd(realDir);
initRealisticBenchmarks;
cd(startDir);

%% Synthetic benchmarks
% get the folders of all synthetic benchmarks
folder = fullfile(realDir, 'SyntheticBenchmarks');
RSFolders = arListD2DProjects(folder, 'subsubfolders');

% loop through all projects and collect the results
for i = 1:length(RSFolders)
    % get the project name
    subDir = RSFolders{i};
    [~, projectName] = fileparts(subDir);
    fprintf('processing project %s:\t', projectName)

    % define and load results file
    resultsName = sprintf('%s__%s.mat', saveName, projectName);
    resultsFile = fullfile(subDir, resultsName);
    if ~isfile(resultsFile)
        fprintf("results file %s not found\n", resultsName);
        continue
    end
    load(resultsFile, 'resultsTable');

    % append the results to the full table
    try
        syntheticIdentifyResults(projectName, :) = resultsTable;
    catch ME
        fprintf("results file %s not compatible. Error: %s\n", resultsName, ME.message);
        continue
    end
    fprintf("done\n");
end

%% Template problems
% get folders of all templates
fast2Folder = fullfile(realDir, 'RS_IMBI', 'fast2_V2');
slow2Folder = fullfile(realDir, 'RS_IMBI', 'slow2_V2');
templateFolders = arListD2DProjects({fast2Folder, slow2Folder}, 'subfolders');

% loop through all projects and collect the results
for i = 1:length(templateFolders)
    % get the project name
    subDir = templateFolders{i};
    [~, projectName] = fileparts(subDir);
    fprintf('processing project %s:\t', projectName)

    % define and load results file
    resultsName = sprintf('%s__%s.mat', saveName, projectName);
    resultsFile = fullfile(subDir, resultsName);
    if ~isfile(resultsFile)
        fprintf("results file %s not found\n", resultsName);
        continue
    end
    load(resultsFile, 'resultsTable');

    % append the results to the full table
    templateIdentifyResults(projectName, :) = resultsTable;
    fprintf("done\n");
end

% save the table of all results
cd(startDir);
outputName = 'collectAllIdentifyResultsData';
save(outputName, 'syntheticIdentifyResults', 'templateIdentifyResults');
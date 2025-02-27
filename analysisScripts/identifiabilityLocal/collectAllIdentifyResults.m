% directly appending the results of the identifiability analysis to the results file
% does not work reliably enough. Therfore, we will collect all results after all
% tests are performed and then append them to the results file.

% initialize the realistic simulations package
realDir = fullfile(pwd(), '..', '..');
startDir = cd(realDir);
initRealisticBenchmarks;
cd(startDir);

% get the folders of all synthetic benchmarks
folder = fullfile(realDir, 'SyntheticBenchmarks');
d2dProjectFolders = arListProjectsRecursive(folder, true, false);

% loop through all projects and collect the results
for i = 1:length(d2dProjectFolders)
    % get the project name
    subDir = d2dProjectFolders{i};
    [~, projectName] = fileparts(subDir);
    fprintf('Processing project: %s\n', projectName)

    % define and load results file
    reultsName = sprintf('resultsIdentifyLocal__%s.mat', projectName);
    resultsFile = fullfile(subDir, reultsName);
    if ~isfile(resultsFile)
        fprintf("Results file not found: %s\n", resultsName);
        continue
    end
    load(resultsName, 'resultsTable');

    % append the results to the full table
    allResultsTable(projectName, :) = resultsTable;
end

% save the table of all results
outputName = 'resultsIdentifyLocalAllCollected';
save(outputName, 'allResultsTable');
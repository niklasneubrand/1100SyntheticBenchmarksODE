% with this script we loop through all synthetic benchmarks and collect the
% custom configurations of the models. The results are saved in a table and
% then saved to a file. The table contains the following columns:
% - projectName: name of the project
% - templateName: name of the template
% - config: fieldnames from ar.config 

diary('getAllCustomConfigs.log');

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
    [parentDir, projectName] = fileparts(subDir);
    [~, templateName] = fileparts(parentDir)
    fprintf('processing project %s:\t', projectName)

    % get custom configs
    try
        customConfigs = getCustomConfigs();
    catch ME
        fprintf("error: %s\n", ME.message);
        continue
    end

    % convert to table and add project and template name
    customConfigsTable = struct2table(customConfigs, 'AsArray', true);
    customConfigsTable.projectName = string(projectName);
    customConfigsTable.templateName = string(templateName);

    % If allCustomConfigsTab does not exist, initialize it
    if ~exist('allCustomConfigsTab', 'var')
        allCustomConfigsTab = customConfigsTable;
    else
        % Fill missing fields with NaN or empty values
        allCustomConfigsTab = outerjoin(allCustomConfigsTab, customConfigsTable, 'MergeKeys', true, 'Type', 'full');
    end

    % append the results to the full table
    fprintf("done\n");
end

% save the table of all results
outputName = 'allCustomConfigs';
save(outputName, 'allCustomConfigsTab');

diary('off');


function customConfigs = getCustomConfigs()

global ar
arLoadLatest('Final')

RSTemplate = arCreateRSTemplate(false, false, false);
customConfigs = RSTemplate.customSettings;
    
end
% write a script that calculates the default RSTemplate and the newRSTemplate for all templates
% and compares the number of time-courses.
% Maybe also compare the condition-observable matrices. But how? Best is graphically.

diary('getAllCustomConfigs.log');

% initialize the realistic simulations package
realDir = fullfile(pwd(), '..', '..');
startDir = cd(realDir);
initRealisticBenchmarks;
cd(startDir);

% get the folders of all compiled base models
fast2Folder = fullfile(realDir, 'RS_IMBI', 'fast2');
slow2Folder = fullfile(realDir, 'RS_IMBI', 'slow2');

fast2dir = dir(fast2Folder);
fast2dir = fast2dir(3:end); % remove . and ..
fast2Folders = fullfile(fast2dir(1).folder, {fast2dir.name})';

slow2dir = dir(slow2Folder);
slow2dir = slow2dir(3:end); % remove . and ..
slow2Folders = fullfile(slow2dir(1).folder, {slow2dir.name})';

problemFolders = [fast2Folders; slow2Folders];

% loop through all projects and collect the results
for i = 1:length(problemFolders)
    % get the project name
    subDir = problemFolders{i};
    [~, templatename] = fileparts(subDir);
    fprintf('processing project %s:\t', templatename)

    oldTemplate = arCreateRSTemplate(true, false, false);
    newTemplate = arCreateRSTemplateNew(true, false, false);

    resultsStruct = struct();
    resultsStruct.templateName = string(templatename);
    resultsStruct.nTCold = oldTemplate.nTC;
    resultsStruct.nTCnew = newTemplate.nTC;
    resultsStruct.oldTemplate = oldTemplate;
    resultsStruct.newTemplate = newTemplate;

    % convert to table and add project and template name
    resultsTab = struct2table(customConfigs, 'AsArray', true);

    % If allCustomConfigsTab does not exist, initialize it
    if ~exist('allCustomConfigsTab', 'var')
        allResultsTable = resultsTab;
    else
        % Fill missing fields with NaN or empty values
        allResultsTable = outerjoin(allResultsTable, resultsTab, 'MergeKeys', true, 'Type', 'full');
    end

    fprintf("done/n")
end
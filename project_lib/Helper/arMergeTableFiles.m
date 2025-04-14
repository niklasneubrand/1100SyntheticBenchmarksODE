function mergedTable = arMergeTableFiles(folder, pattern, saveFile)
% Merge all table files matching the pattern into a single file.
% The merged file will be saved as outFile.

arguments
    folder (1,:) char = pwd()
    pattern (1,:) char = '*.mat'
    saveFile (1,:) char = ''
end

tableFiles = dir(fullfile(folder, pattern));
if isempty(tableFiles)
    fprintf('No table files found in %s matching pattern %s\n', folder, pattern)
    return
end

fprintf('Found %d table files in %s matching pattern %s\n', length(tableFiles), folder, pattern)
fprintf('Merging table files...\n')

mergedTable = table();
for i = 1:length(tableFiles)
    fileName = fullfile(folder, tableFiles(i).name);
    fprintf('Loading %s\n', fileName)
    tableData = importdata(fileName);
    mergedTable = [mergedTable; tableData]; %#ok<AGROW>
end

% add template name to the merged table
variables = mergedTable.Properties.VariableNames;
if ismember('projectName', variables) && ~ismember('templateName', variables)
    % if the template name is not present, add it from the project name
    projectNameParts = split(mergedTable.projectName, '_', 2);
    mergedTable.templateName = projectNameParts(:, 1);
    mergedTable.isTemplate = ~strncmp(projectNameParts(:, 2), 'RS', 2);
    % move the templateName to the first column
    mergedTable = movevars(mergedTable, 'templateName', 'Before', 'projectName');
end

if strcmp(saveFile, '')
    % do not save file
    return
end

fprintf('Saving merged table to %s\n', saveFile)
save(saveFile, 'mergedTable')

end
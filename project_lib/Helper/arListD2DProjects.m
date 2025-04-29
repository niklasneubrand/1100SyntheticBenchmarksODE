function d2dProjectFolders = arListD2DProjects(folder, method, includeFolder, requireCompiled)

% todo:
% - create the arApply function that generalizes the arApplyRecursive
% function

arguments
    folder (1,:) string = pwd()
    method (1,1) string {mustBeMember(method, ["subfolders", "subsubfolders", "recursive"])} = "subfolders"
    includeFolder (1,1) logical = true
    requireCompiled (1,1) logical = false
end

% if multiple folders are given, evaluate each folder and join results
if length(folder) > 1
    d2dProjectFolders = {};
    for id = 1:length(folder)
        addFolders = arListD2DProjects(folder(id), method, includeFolder, requireCompiled);
        d2dProjectFolders = [d2dProjectFolders; addFolders];
    end
    return
end

% convert to absolute path
folderDir = dir(folder);
if isempty(folderDir) || ~folderDir(1).isdir
    error('The given folder does not exist or is not a directory.')
end
folder = string(folderDir(1).folder);

% get char array of all subdirectories (recursive)
switch method
    case {"subfolders", "subsubfolders"}
        % get char array of all subdirectories (non-recursive)
        subDirs = {folderDir([folderDir.isdir]).name}';
        if includeFolder
            % remove only '..'
            subDirs = subDirs(~ismember(subDirs, {'..'}));
        else
            % remove '.' and '..'
            subDirs = subDirs(~ismember(subDirs, {'.', '..'}));
        end
        % prepend the folder path to each subdirectory
        subDirs = fullfile(folder, subDirs);
        if strcmp(method, "subsubfolders")
            % apply recursively
            d2dProjectFolders = arListD2DProjects(subDirs, "subfolders", true, requireCompiled);
            return
        end
    case "recursive"
        % get char array of all subdirectories (recursive)
        subDirs = split(genpath(folder), pathsep);
        subDirs = subDirs(1:end-1);  % remove last empty string
        % if desired, remove the folder itself
        if ~includeFolder
            subDirs = subDirs(2:end);
        end
    otherwise
        error('Invalid method. Use "subfolders" or "recursive".')
end
subDirs = string(subDirs);


% find all d2d project folders (with or without compiled results)
d2dProjectFolders = [];
for id = 1:length(subDirs)
    subDir = subDirs(id);

    % skip d2d backup folders (they also have Models and Data folders)
    isBackup = contains(subDir, 'Results') && contains(subDir, 'Backup');
    if isBackup
        continue
    end

    % check if the folder is a d2d project (and optionally compiled)
    isD2DProject = exist(fullfile(subDir, 'Models'), 'dir') && ...
        exist(fullfile(subDir, 'Data'), 'dir');
    isCompiled = exist(fullfile(subDir, 'Results'), 'dir');

    % append to list as required
    if isD2DProject && (~requireCompiled || isCompiled)
        d2dProjectFolders = [d2dProjectFolders; subDir];
    end
end


end
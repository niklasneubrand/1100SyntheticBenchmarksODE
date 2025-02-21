function d2dProjectFolders = arListProjectsRecursive(folder, includeFolder, requireCompiled)

arguments
    folder (1,1) string = pwd()
    includeFolder (1,1) logical = true
    requireCompiled (1,1) logical = false
end

% get char array of all subdirectories (recursive)
subDirsRec =  split(genpath(folder), pathsep);
subDirsRec = subDirsRec(1:end-1);  % remove last empty string
% if desired, remove the folder itself
if ~includeFolder
    subDirsRec = subDirsRec(2:end);
end

% find all d2d project folders (with or without compiled results)
d2dProjectFolders = {};
for id = 1:length(subDirsRec)
    subDir = subDirsRec{id};

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
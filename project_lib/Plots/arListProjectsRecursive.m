function d2dProjectFolders = arListProjectsRecursive(folder, includeFolder)

arguments
    folder (1,1) string = pwd()
    includeFolder (1,1) logical = true
end

subDirsRec =  split(genpath(folder), pathsep);  % get all subdirectories (recursive)
subDirsRec = subDirsRec(1:end-1);  % remove last empty string
% if desired, remove the folder itself
if ~includeFolder
    subDirsRec = subDirsRec(2:end);
end

% find all folders with Models, Data and Results subfolders (i.e. d2d project folders)
d2dProjectFolders = {};
for id = 1:length(subDirsRec)
    subDir = subDirsRec{id};
    if exist(fullfile(subDir, 'Models'), 'dir') && ...
        exist(fullfile(subDir, 'Data'), 'dir') && ...
        exist(fullfile(subDir, 'Results'), 'dir')
        d2dProjectFolders = [d2dProjectFolders; subDir];
        % arAllPlots(subDir);
    end
end


end
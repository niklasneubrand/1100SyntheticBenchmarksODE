function reportTable = arApplyRecursive(func, folder, varargin, options)

arguments
    func (1,1) function_handle
    folder (1,1) string = pwd()
end

% optional arguments for the function handle
arguments (Repeating)
    varargin
end

% options (Name-Value pairs)
arguments
    options.includeFolder (1,1) logical = true
    options.requireCompiled (1,1) logical = false
    options.reportName (1,:) char = ''
end

global ar

startDir = cd(folder);
d2dProjectFolders = arListProjectsRecursive(pwd(), options.includeFolder, options.requireCompiled);

% loop through all projects
for id = 1:length(d2dProjectFolders)
    subDir = d2dProjectFolders{id};
    [~, projectName] = fileparts(subDir);
    projectName = string(projectName);
    fprintf('Processing project: %s\n', projectName)
    cd(subDir);
    try
        func(varargin{:});
        success = true;
        errorReport = "";
    catch ME
        success = false;
        errorReport = string(getReport(ME, "extended", "hyperlinks", "off"));
        display(getReport(ME, "extended", "hyperlinks", "on"));
    end
    reportTable(id, :) = table(projectName, success, errorReport);
end

cd(startDir)

% save the report table
if exist('reportTable', 'var') && ~isempty(options.reportName)
    save(options.reportName, 'reportTable')
end

end
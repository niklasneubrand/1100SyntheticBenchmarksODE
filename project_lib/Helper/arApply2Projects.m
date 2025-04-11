function reportTable = arApply2Projects(func, folder, varargin, options)
% ARAPPLY2PROJECTS Apply a function to multiple D2D projects in a directory
%
% INPUTS:
%   func: function handle to be applied to each project
%   folder: (optional) path to the directory containing the projects
%          (default: pwd)
%   varargin: additional arguments to be passed to the function
%   options: Name-Value pairs for additional options
%       method: Method to find project folders ('subfolders' or 'recursive', default: 'subfolders')
%       includeFolder: Whether to include the folder itself in the search (default: true)
%       requireCompiled: Whether to only include folders with compiled results (default: false)
%       reportName: Name of the report file to save the results (default: 'report_arApply2Projects.mat')
%
% OUTPUTS:
%   reportTable: Table containing the results of the function application

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
    options.method (1,1) string {mustBeMember(options.method, ["subfolders", "recursive"])} = "subfolders"
    options.includeFolder (1,1) logical = true
    options.requireCompiled (1,1) logical = false
    options.reportName (1,:) char = 'report_arApply2Projects.mat'
end

global ar

startDir = cd(folder);
d2dProjectFolders = arListD2DProjects(pwd(), options.method, options.includeFolder, options.requireCompiled);

% loop through all projects
for id = 1:length(d2dProjectFolders)
    subDir = d2dProjectFolders(id);
    [~, projectName] = fileparts(subDir);
    if strcmp(projectName, "")
        [~, projectName] = fileparts(folder);
    end
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
    projectName = string(projectName);
    subDir = string(subDir);
    % create a table to store the results
    reportTable(projectName, :) = table(projectName, subDir, success, errorReport);
end

cd(startDir)

% save the report table
if exist('reportTable', 'var') && ~isempty(options.reportName)
    save(options.reportName, 'reportTable')
end

end
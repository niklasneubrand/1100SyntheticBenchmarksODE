function localOptimizationVariantsMulti(variant, folder, loadName, saveName, varargin)
% LOCALOPTIMIZATIONRECURSIVE Apply local optimization to all projects in a directory
%
% INPUTS:
%   variant: (optional) variant of local optimization to apply
%        (default: 'localOptimization')
%   folder: (optional) path to the directory containing the projects
%        (default: pwd)
%   loadName: (optional) name of the file to load (default: 'Final')
%   saveName: (optional) name of the file to save (default: 'localOptimization')

arguments
    variant (1,1) string {mustBeMember(variant, ["default", "stepwise", "restricted"])} = "default"
    folder (1,1) string = pwd()
    loadName (1,1) string = 'Final'
    saveName (1,1) string = 'localOptimization'
end

% Name Value pairs for localOptimization in form 'config.name', value
%   e.g. 'config.maxIter', 1e5
arguments (Repeating)
    varargin
end

% initialize the realistic simulations package 
startDir = pwd();
cd('../..');
initRealisticBenchmarks;
cd(startDir);
% get the name of the template from the directory
[~, templateName] = fileparts(folder);
reportName = sprintf('apply2ProjectsReport__%s__%s', saveName, templateName);

% set the function handle for the local optimization variant
switch variant
    case "default"
        optimFunc = @localOptimization;
    case "stepwise"
        optimFunc = @localOptimizationStepwise;
    case "restricted"
        optimFunc = @localOptimizationRestricted;
end

arApply2Projects( ...
    optimFunc, folder, ...     % required arguments
    loadName, saveName, ...             % arguments for the function handle
    varargin{:}, ...                    % Name-Value pairs for localOptimization
    reportName=reportName)              % Name-Value pairs for arApply2Projects

end
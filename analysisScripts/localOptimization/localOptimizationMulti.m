function localOptimizationMulti(folder)
% LOCALOPTIMIZATIONRECURSIVE Apply local optimization to all projects in a directory
%
% INPUTS:
%   folder: (optional) path to the directory containing the projects
%        (default: pwd)
%

arguments
    folder (1,1) string = pwd()
end

% initialize the realistic simulations package 
startDir = pwd();
cd('../..');
initRealisticBenchmarks;
cd(startDir);

% get the name of the template from the directory
[~, templateName] = fileparts(folder);
reportName = sprintf('apply2ProjectsReport__localOptimization__%s', templateName);

% set the name of the load and save files
loadName = 'Final';
saveName = 'localOptimization';

arApply2Projects( ...
    @localOptimization, folder, ...     % required arguments
    loadName, saveName, ...             % optional arguments for the function handle
    reportName=reportName);             % Name-Value pairs (options)

end
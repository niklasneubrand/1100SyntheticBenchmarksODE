function localOptimizationRecursive(folder)
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
reportName = sprintf('recursiveReport__localOtimization__%s', templateName);

% set the name of the load and save files
loadName = 'Final';
saveName = 'localOptimization';

% apply identifiability analysis to all projects in the directory
arApplyRecursive( ...
    @localOptimization, folder, ...                 % required arguments
    loadName, saveName, ...                         % optional arguments for the function handle
    reportName=reportName, requireCompiled=false);  % Name-Value pairs (options)

end
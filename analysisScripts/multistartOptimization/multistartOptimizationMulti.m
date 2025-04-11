function multistartOptimizationMulti(folder, loadName, saveName, nLHS, seed)
% LOCALOPTIMIZATIONRECURSIVE Apply local optimization to all projects in a directory
%
% INPUTS:
%   folder: (optional) path to the directory containing the projects
%        (default: pwd)
%   loadName: (optional) name of the file to load (default: 'Final')
%   saveName: (optional) name of the file to save (default: 'localOptimization')
%   nLHS: (optional) number of multistart samples (default: 100)
%   seed: (optional) random seed for multistart (default: 1)

arguments
    folder (1,1) string = pwd()
    loadName (1,1) string = 'Final'
    saveName (1,1) string = 'localOptimization'
    nLHS (1,1) double = 100
    seed (1,1) double = 1
end

% initialize the realistic simulations package 
startDir = pwd();
cd('../..');
initRealisticBenchmarks;
cd(startDir);

% get the name of the template from the directory
[~, templateName] = fileparts(folder);
reportName = sprintf('apply2ProjectsReport__localOptimization__%s', templateName);

arApply2Projects( ...
    @multistartOptimization, folder, ...     % required arguments
    loadName, saveName, nLHS, seed, ...             % arguments for the function handle
    reportName=reportName);             % Name-Value pairs (options)

end
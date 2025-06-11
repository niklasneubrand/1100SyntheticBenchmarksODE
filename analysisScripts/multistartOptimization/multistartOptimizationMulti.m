function multistartOptimizationMulti(folder, loadName, saveName, nLHS, seed, varargin)
% LOCALOPTIMIZATIONRECURSIVE Apply local optimization to all projects in a directory
%
% INPUTS:
%   folder: (optional) path to the directory containing the projects
%        (default: pwd)
%   loadName: (optional) name of the file to load (default: 'Final')
%   saveName: (optional) name of the file to save (default: 'multistartOptimization')
%   nLHS: (optional) number of multistart samples (default: 100)
%   seed: (optional) random seed for multistart (default: 1)

arguments
    folder (1,1) string = pwd()
    loadName (1,1) string = 'Final'
    saveName (1,1) string = 'multistartOptimization'
    nLHS (1,1) double = 100
    seed (1,1) double = 1
end

% Name Value pairs for d2d in form 'name', value
%   e.g. 'rtol', 1e-8, 'MaxIter', 1e5
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

arApply2Projects( ...
    @multistartOptimization, folder, ...    % required arguments
    loadName, saveName, nLHS, seed, ...     % arguments for the function handle
    varargin{:}, ...                       % Name-Value pairs for multistartOptimization
    reportName=reportName);                 % Name-Value pairs (options)

end
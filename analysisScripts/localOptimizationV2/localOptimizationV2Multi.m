function localOptimizationV2Multi(folder, loadName, saveName, varargin)
% LOCALOPTIMIZATIONV2MULTI Apply local optimization to all projects in a directory
%
% INPUTS:
%   folder: (optional) path to the directory containing the projects
%        (default: pwd)
%   loadName: (optional) name of the file to load (default: 'CompiledProject')
%   saveName: (optional) name of the file to save (default: 'localOptimization')

arguments
    folder (1,1) string = pwd()
    loadName (1,1) string = 'CompiledProject'
    saveName (1,1) string = 'localOptimization'
end

% Name Value pairs for localOptimization in form 'name', value
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
reportName = sprintf('report__%s__%s', saveName, templateName);

arApply2Projects( ...
    @localOptimizationV2, folder, ...     % required arguments
    loadName, saveName, ...             % arguments for the function handle
    varargin{:}, ...                    % Name-Value pairs for localOptimization
    reportName=reportName)              % Name-Value pairs for arApply2Projects

end
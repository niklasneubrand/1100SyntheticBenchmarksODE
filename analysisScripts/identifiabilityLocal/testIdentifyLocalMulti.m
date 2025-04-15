function testIdentifyLocalMulti(folder, loadNames, saveName)
% TESTIDENTIFYLOCALRECURSIVE Apply identifiability analysis to all projects in a directory
%
% INPUTS:
%   folder: (optional) path to the directory containing the projects
%        (default: pwd)
%   loadNames: (optional) name of the files to load. 
%       (default: 'localOptimization')
%   saveName: (optional) name of the file to save (default: 'localIdentifyTest')

%

arguments
    folder (1,1) string = pwd()
    loadNames (1,:) string = ["localOptimization_V2", "localOptimization_restricted_V2", "localOptimization_V3"]
    saveName (1,1) string = "localIdentifyTest"
end

% initialize the realistic simulations package 
startDir = pwd();
cd('../..');
initRealisticBenchmarks;
cd(startDir);

% get the name of the template from the directory
[~, templateName] = fileparts(folder);
reportName = sprintf('apply2ProjectsReport__%s__%s', saveName, templateName);

% apply identifiability analysis to all projects in the directory
arApply2Projects( ...
    @testIdentifyLocal, folder, ...     % required arguments
    loadNames, saveName, ...             % arguments for the function handle
    reportName=reportName);             % Name-Value pairs (options)

% arApplyRecursive( ...
%     @testIdentifyLocal, folder, 'resultsIdentifyLocal', false, ...
%     reportName=outputName, requireCompiled=false);

end
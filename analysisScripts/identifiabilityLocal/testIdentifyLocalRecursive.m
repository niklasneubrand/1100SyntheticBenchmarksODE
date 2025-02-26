function testIdentifyLocalRecursive(folder)
% TESTIDENTIFYLOCALRECURSIVE Apply identifiability analysis to all projects in a directory
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
outputName = sprintf('recursiveReport__testIdentifyLocal__%s', templateName);

% apply identifiability analysis to all projects in the directory
arApplyRecursive( ...
    @testIdentifyLocal, folder, 'resultsIdentifyLocal', false, ...
    reportName=outputName, requireCompiled=false);

end
function testIdentifyLocalRecursive(dir)
% TESTIDENTIFYLOCALRECURSIVE Apply identifiability analysis to all projects in a directory
%
% INPUTS:
%   dir: (optional) path to the directory containing the projects
%        (default: pwd)
%

arguments
    dir (1,1) string = pwd()
end

% initialize the realistic simulations package 
startDir = pwd();
cd('../..');
initRealisticBenchmarks;
cd(startDir);

% get the name of the template from the directory
[~, templateName] = fileparts(dir);
outputName = sprintf('recursiveReport__testIdentifyLocal__%s', templateName);

% apply identifiability analysis to all projects in the directory
arApplyRecursive(@testIdentifyLocal, dir, 'resultsIdentifyLocal', reportName=outputName, requireCompiled=false);

end
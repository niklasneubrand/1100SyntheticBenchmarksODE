function fixDRrecursive(folder)
% FIXDRRECURSIVE Apply bug fix dose response data sets recursively to all projects in a directory

% initialize the realistic simulations package
startDir = pwd();
cd('../..');
initRealisticBenchmarks;
cd(startDir);

% get the name of the template from the directory
[~, templateName] = fileparts(folder);
outputName = sprintf('recursiveReport__fixDRdatasets__%s', templateName);

% apply bug fix to all projects in the di	rectory
arApplyRecursive( ...
    @fixDoseresponseDataSets, folder, ...
    reportName=outputName, requireCompiled=false, includeFolder=false);

end
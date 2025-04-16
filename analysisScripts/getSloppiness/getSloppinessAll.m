% this script calculates the sloppiness of all the models in the
% realistic simulations package. The results are saved in a table and
% then saved to a file. The table contains the following columns:
% - projectName: name of the project
% - templateName: name of the template
% - log10HessEigen: log10 of normalized eigenvalues of Hessian in local optimum
% - minlog10HessEigen: minimum log10 of normalized eigenvalues of Hessian in local optimum
% - qSloppy: true if the model is sloppy, false otherwise

mainLog = 'getSloppinessAll.log';
projectLog ='sloppinessAnalysis_V1.log';
diary(mainLog);

%% OPTIONS
loadNames = {'localOptimization_V2', 'localOptimization_V3'};
zeroThreshold = -12;
sloppyThreshold = -6;

% initialize the realistic simulations package
realDir = fullfile(pwd(), '..', '..');
startDir = cd(realDir);
initRealisticBenchmarks;
cd(startDir);

% get the folders of all compiled models (templates and synthetic benchmarks)
fast2Folder = fullfile(realDir, 'RS_IMBI', 'fast2_V2');
slow2Folder = fullfile(realDir, 'RS_IMBI', 'slow2_V2');
templateFolders = {fast2Folder, slow2Folder};
templateFolders = arListD2DProjects(templateFolders, "subfolders");
rsFolders = fullfile(realDir, 'SyntheticBenchmarks');
rsFolders = arListD2DProjects(rsFolders, "recursive");
d2dProjectFolders = [templateFolders; rsFolders];

% loop through all projects and collect the results
for i = 1:length(d2dProjectFolders)
    % get the project name
    subDir = d2dProjectFolders{i};
    [parentDir, projectName] = fileparts(subDir);
    [~, templateName] = fileparts(parentDir);
    fprintf('processing project %s:\t', projectName)

    % load the model and calculate the sloppiness
    try
        cd(subDir);
        diary(projectLog)
        sloppyTable = calcSloppiness(loadNames, ... 
            zeroThreshold=zeroThreshold, ...
            sloppyThreshold=sloppyThreshold);
        diary(mainLog)
    catch ME
        fprintf("error: %s\n", ME.message);
        continue
    end

    % If allSloppinessTab does not exist, initialize it
    if ~exist('allSloppinessTab', 'var')
        allSloppinessTab = sloppyTable;
    else
        % Fill missing fields with NaN or empty values
        allSloppinessTab(end+1, :) = sloppyTable;
    end

    fprintf("done\n")
end

% save the table of all results
cd(startDir);
outputName = 'allSloppinessTab';
save(outputName, 'allSloppinessTab');

diary('off')
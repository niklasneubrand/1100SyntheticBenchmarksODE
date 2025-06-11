function analyseMultistartAll(loadName, chi2Threshold)

arguments
    loadName (1,1) string = "multistartOptimizationV2_6";
    chi2Threshold (1,1) double = 0.01;
end

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
rsFolders = arListD2DProjects(rsFolders, "subsubfolders");
d2dProjectFolders = [templateFolders; rsFolders];

% loop through all projects and collect the results
for i = 1:length(d2dProjectFolders)
    % get the project name
    subDir = d2dProjectFolders{i};
    [~, projectName] = fileparts(subDir);
    fprintf('processing project %s:\t', projectName)

    % load the model and analyze the multistart results
    try
        cd(subDir);
        multistartTable = analyseMultistart(loadName, chi2Threshold);
    catch ME
        fprintf("error: %s\n", ME.message);
        continue
    end

    % If allMultistartTab does not exist, initialize it
    if ~exist('allMultistartTab', 'var')
        allMultistartTab = multistartTable;
    else
        % Fill missing fields with NaN or empty values
        allMultistartTab(end+1, :) = multistartTable;
    end

    fprintf("done\n")
end

% save the table of all results
cd(startDir);
outputName = sprintf('allMultistartTab_%s', loadName);
save(outputName, 'allMultistartTab');

end


function multistartTable = analyseMultistart(loadName, chi2Threshold)

arguments
    loadName (1,1) string = "multistartOptimizationV2_2";
    chi2Threshold (1,1) double = 0.01;
end

%% init d2d and load the locally fitted model
global ar
loaded = arLoadLatest(loadName);
if ~loaded
    error('No Results folder found with loadPattern "%s"', loadName)
end

%% define the project and template name
projectName = string(ar.info.name);
nameParts = split(projectName, '_', 2);
templateName = string(nameParts(1));

%% analyze the multistart results
fprintf('Run multistart analysis.\n')
multistartStruct = arAnalyseLhsResults(chi2Threshold);

%% create results table
multistartStruct.projectName = projectName;
multistartStruct.templateName = templateName;
multistartTable = structToTableWithCells(multistartStruct);

% make sure all (potentially) array-type fields are of type cell
checkList = {'chi2_list', 'chi2_sorted', 'iSort', 'levelLink', ....
    'levelVals', 'levelPopulation', 'fitTimes', 'exitflag'};
for i = 1:length(checkList)
    fieldName = checkList{i};
    if isnumeric(multistartTable.(fieldName))
        % if the field is numeric, convert it to a cell array
        multistartTable.(fieldName) = {multistartTable.(fieldName)};
    end
end


save(sprintf('%s.mat', loadName), 'multistartTable');

end

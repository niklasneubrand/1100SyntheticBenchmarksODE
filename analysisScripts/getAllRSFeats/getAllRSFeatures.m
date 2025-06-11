global ar

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
startDir = pwd();

% collect thje features of all models
for id = 1:length(d2dProjectFolders)
    % get the project name
    subDir = d2dProjectFolders{id};
    [parentDir, projectName] = fileparts(subDir);
    nameParts = split(projectName, '_', 2);
    templateName = string(nameParts(1));
    qTemplate = ~contains(projectName, '_RS');
    fprintf('processing project %s:\t', projectName)
    
    cd(subDir);
    if qTemplate
        loadSuccess = arLoadLatest('normal');
    else
        loadSuccess = arLoadLatest('CompiledProject');
    end
    
    if ~loadSuccess
        continue
    end

    modelFeatures = collectRSFeatures();

    modelFeatures.projectName = string(projectName);
    modelFeatures = rmfield(modelFeatures, 'modelName');
    modelFeatures.templateName = templateName;
    modelFeatures.qTemplate = qTemplate;

    if ~exist('allFeatures', 'var')
        allFeatures = struct2table(modelFeatures);
    else
        allFeatures = [allFeatures; struct2table(modelFeatures)];
    end
end

templateFeats = allFeatures(allFeatures.qTemplate == 1, :);
syntheticFeats = allFeatures(allFeatures.qTemplate == 0, :);

save(fullfile(startDir,'allProjectFeats.mat'), 'templateFeats', 'syntheticFeats', 'allFeatures')

cd(startDir)
%% collect the data from the ar structs

startDir = pwd();

baseModelsFastDir = "C:\Users\neubrand\Documents\d2d\projects\RealisticBenchmarks\BaseModels\fast";
folders = dir(baseModelsFastDir);
folders = folders(3:end);
folderDirs = {folders.folder};
folderNames = {folders.name};

baseModelsSlowDir = "C:\Users\neubrand\Documents\d2d\projects\RealisticBenchmarks\BaseModels\slow";
folders = dir(baseModelsSlowDir);
folders = folders(3:end);
folderDirs = [folderDirs, {folders.folder}];
folderNames = [folderNames, {folders.name}];

dynStates = struct();

for ii=1:length(folderNames)
    cd(fullfile(folderDirs{ii}, folderNames{ii}))
    loaded = arLoadLatest('normal');
    if ~loaded
        continue
    end
    try
        load("RSTemplate/RSTemplate.mat")
    catch
        RSTemplate = arCreateRSTemplate(true, false, true);
    end
    
    [~, ratioDynCurves] = arDynCondStates(1, RSTemplate, 1);
    dynStates(ii).modelName = string(ar.info.name);
    dynStates(ii).ratioDynCurves = {ratioDynCurves};

end

% remove models that did not load
idx = cellfun(@isempty, {dynStates.ratioDynCurves});
dynStates(idx) = [];

cd(startDir);

save("dynStates", "dynStates")
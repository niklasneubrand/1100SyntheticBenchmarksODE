function [baseModelFeats, rsModelFeats] = collectAllRSFeatures(folder)

arguments
    folder (1,1) string = pwd()
end

global ar

d2dProjectFolders = arListProjectsRecursive(folder, true);
startDir = cd(folder);
[~, folderName] = fileparts(folder);

% allFeatures = struct();

% create plots for all realistic simulations
for id = 1:length(d2dProjectFolders)
    subDir = d2dProjectFolders{id};
    
    prevDir = cd(subDir);
    try 
        if exist(fullfile(subDir, 'RealisticSimulation'), "dir")
            loadSuccess = arLoadLatest('normal');
        else
            loadSuccess = arLoadLatest('Final');
        end
        
        if ~loadSuccess
            continue
        end

        modelFeatures = collectRSFeatures();
        modelName = string(ar.info.name);
        nameParts = split(modelName, '_');
        modelFeatures.baseModelName = nameParts(1);

        qBaseModel = ~contains(ar.info.name, 'RS');
        if qBaseModel
            modelFeatures.RSIndex = 0;
        else
            nameParts = split(ar.info.name, 'RS');
            modelFeatures.RSIndex = str2num(nameParts{end});
        end

        if ~exist('allFeatures', 'var')
            allFeatures = struct2table(modelFeatures);
        else
            allFeatures = [allFeatures; struct2table(modelFeatures)];
        end
    catch
        cd(prevDir)
    end
end

baseModelFeats = allFeatures(allFeatures.RSIndex == 0, :);
rsModelFeats = allFeatures(allFeatures.RSIndex ~= 0, :);

save(fullfile(folder, sprintf('%s_modelFeats.mat', folderName)), 'baseModelFeats', "rsModelFeats")

cd(startDir)

end
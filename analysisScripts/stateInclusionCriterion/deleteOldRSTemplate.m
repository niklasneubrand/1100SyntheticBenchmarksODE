%% collect the data from the ar structs

baseModelsFastDir = "C:\Users\neubrand\Documents\d2d\projects\RealisticBenchmarks\BaseModels\fast";
startDir = cd(baseModelsFastDir);

folders = dir();
folders = folders(3:end);
folderNames = {folders.name};

dynStates = struct();

for ii=1:length(folderNames)
    cd(fullfile(baseModelsFastDir, folderNames{ii}))
    try
        rmdir("RS_Template")
        fprintf('deleted: %s\n', folderNames{ii})
    catch
        fprintf('not deleted: %s\n', folderNames{ii})
    end


end


cd(startDir);
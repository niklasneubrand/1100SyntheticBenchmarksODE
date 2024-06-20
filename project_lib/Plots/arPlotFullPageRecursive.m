function arPlotFullPageRecursive(folder)

arguments
    folder (1,1) string = pwd()
end

global ar

d2dProjectFolders = arListProjectsRecursive(folder, true);
prevDir = cd(folder);

% create plots for all realistic simulations
for id = 1:length(d2dProjectFolders)
    subDir = d2dProjectFolders{id};
    if exist(fullfile(subDir, 'RealisticSimulation'), "dir")
        % skip base models
        % they might have incompatible plot settings (e.g. dose-response)
        continue
    elseif exist(fullfile(subDir, 'Auxillary'), "dir")
        % 'Auxillary' exists in all realistic simualtions
        prevDir = cd(subDir);

        % if the model is compiled on linux cluster, we have to recompile
        % but there are some issues. To fix, save and reload the model
        arLoadLatest('final');
        ar.config.backup_modelAndData = 1;
        arSave('backup');
        arLoadLatest('backup');
        arRecompile();
        arSave('final_windows')
        try
            arPlotFullPage();
        catch ME
            cd(prevDir),
            display(getReport(ME, "extended", "hyperlinks", "on"))
        end
    end
end

cd(prevDir)

end
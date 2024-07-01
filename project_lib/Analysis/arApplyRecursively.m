function arApplyRecursively(folder, qIncludeBaseModel, funcName, func, varargin)


arguments
    folder (1,1) string
    qIncludeBaseModel (1,1) logical
    funcName (1,1) string
    func (1,1) function_handle
end

arguments (Repeating)
    varargin
end

global ar

d2dProjectFolders = arListProjectsRecursive(folder, true);
prevDir = cd(folder);

% create plots for all realistic simulations
for id = 1:length(d2dProjectFolders)
    subDir = d2dProjectFolders{id};
    
    if exist(fullfile(subDir, 'RealisticSimulation'), "dir") || ~qIncludeBaseModel
        % skip base models
        % they might have incompatible plot settings (e.g. dose-response)
        continue
    else
        prevDir = cd(subDir);
        arLoadLatest('final');
        try
            func(varargin{:});
            arSave(sprintf('%s__%s', ar.info.name, funcName));
        catch ME
            cd(prevDir),
            display(getReport(ME, "extended", "hyperlinks", "on"))
        end
    end
end

cd(prevDir)

end
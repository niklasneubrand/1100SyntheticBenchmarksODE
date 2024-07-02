folder = pwd();
d2dProjectFolders = {dir(folder).name};
d2dProjectFolders = d2dProjectFolders(3:end);
prevDir = cd(folder);

% create plots for all realistic simulations
for id = 1:length(d2dProjectFolders)
    subDir = d2dProjectFolders{id};
    prevDir = cd(subDir);
    
    if exist(fullfile(pwd(), 'RealisticSimulation'), "dir")
        
        % search the latest options_manyRS file
        optionsDir = fullfile(pwd(), 'RealisticSimulation', 'info_manyRS');
        files = dir(fullfile(optionsDir, 'options_manyRS_*.mat'));
        [~, idx] = sort([files.datenum]);
        files = files(idx);
        options_manyRS_file = fullfile(optionsDir, files(1).name);
        
        
        % Get the list of all folders
        RSfolders = dir(fullfile(pwd(), 'RealisticSimulation'));
        RSfolderNames = {RSfolders.name};
        pattern = '_RS0*1$';
        qFirstSimu = cellfun(@(x) ~isempty(regexp(x, pattern, 'once')), RSfolderNames);
        if sum(qFirstSimu) == 1
            options_file = fullfile(pwd(), 'RealisticSimulation', RSfolderNames{qFirstSimu}, 'Auxillary', 'options_RS.mat');
            load(options_file, 'options')
            save(options_manyRS_file, 'options')
            fprintf('%s -> %s', options_file, options_manyRS_file);
        else
            warning('No options file found for the first simulation.')
        end
    end

    cd(prevDir)
end

cd(prevDir)
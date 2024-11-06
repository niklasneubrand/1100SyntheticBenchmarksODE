function arSBMLConformBaseModels(modelSet)

arguments
    modelSet = 'fast'
end

global ar

startDir = fileparts(mfilename('fullpath'));
baseModelDir = fullfile(startDir, '..', '..', 'BaseModels');

dirStruct = dir(fullfile(baseModelDir, modelSet));
dirStruct = dirStruct([dirStruct.isdir]);
dirStruct = dirStruct(~ismember({dirStruct.name}, {'.', '..'}));
folders = {dirStruct.folder};
names = {dirStruct.name};

for ii = 1:length(folders)
    cd(fullfile(folders{ii}, names{ii}));

    qLoaded = arLoadLatest('normal');
    if ~qLoaded
        fprintf('Model %s not loaded\n', names{ii});
        continue
    end
    
    arUpdatePaths()

    sbmlCompatible = arCheckSBMLCompatibility(1);
    if sbmlCompatible
        fprintf('Model %s already SBML compatible\n', names{ii});
        continue
    end

    fprintf('Converting model %s to be SBML compatible\n', names{ii});

    targetDir = fullfile(folders{ii}, '..', sprintf('%s_SBML', modelSet), names{ii});
    [~] = mkdir(targetDir);
    try
        diary(fullfile(targetDir, 'sbml_rename.log'));
        arRenameModelCondPars(1, targetDir, false);
        cd(targetDir);
        arCompileAllSetups;
        diary off
    catch ME
        fprintf('Error converting model %s: %s\n', names{ii}, ME.message);
        diary off
    end
end

end
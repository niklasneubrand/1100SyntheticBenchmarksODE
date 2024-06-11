% restore the matlab path (d2d, projects, ...)
userpath("reset");
addpath(userpath());
startup;

% RTF specific
arInit();
rtfPath = fullfile(ar.info.ar_path, ...
                   'Examples', 'ToyModels', ...
                   'TransientFunction', 'TransientFunction_library');
addpath(rtfPath)


% project specific
realisticDir = fileparts(mfilename('fullpath'));
addpath(fullfile(realisticDir, 'RealisticSimulation'))
addpath(fullfile(realisticDir, 'CondObsStructure'))
addpath(fullfile(realisticDir, 'Plots'))
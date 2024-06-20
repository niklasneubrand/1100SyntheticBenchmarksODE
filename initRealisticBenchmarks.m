% restore the matlab path (d2d, projects, ...)
userpath("reset");
addpath(userpath());
try
    startup;
catch
end

% RTF specific
arInit();
rtfPath = fullfile(ar.info.ar_path, ...
                   'Examples', 'ToyModels', ...
                   'TransientFunction', 'TransientFunction_library');
addpath(rtfPath)


% project specific
realisticDir = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(realisticDir, 'project_lib')));
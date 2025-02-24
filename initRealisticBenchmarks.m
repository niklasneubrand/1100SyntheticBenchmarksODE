% restore the matlab path (d2d, projects, ...)
userpath("reset");
addpath(userpath());
try
    startup;
catch
end

arInit();

% RTF specific
% rtfPath = fullfile(ar.info.ar_path, ...
%                    'Examples', 'ToyModels', ...
%                    'TransientFunction', 'TransientFunction_library');
% addpath(rtfPath)


% realistic simulation specific
realisticDir = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(realisticDir, 'project_lib')));
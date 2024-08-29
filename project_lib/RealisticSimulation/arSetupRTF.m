function arSetupRTF()
% ARSETUPRTF  Initializes RTF functions, compiles RTF model in current folder
%
%   Inputs:
%       None
%
%   Outputs:
%       None
%
%   See also ARINIT, ARLOADMODEL, ARCOMPILEALL
 

arInit();

% create models folder
modelPath = fullfile(ar.info.path, 'Models');
[~] = mkdir(modelPath);

% add the transient function library to the path
rtfPath = fullfile(ar.info.ar_path, ...
                   'Examples', 'ToyModels', ...
                   'TransientFunction', 'TransientFunction_library');
addpath(rtfPath)

% copy RTF .def file to models folder
copyfile(fullfile(rtfPath, 'TransientFunction.def'), modelPath)

% load the model and compile it
arLoadModel('TransientFunction')
arCompileAll

end
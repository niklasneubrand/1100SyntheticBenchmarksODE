function arCompileBaseModels(inputModelSet, outputModelSet)

% This function copies all models located in 'RealisticBenchmarks/BaseModels/inputModelSet'
% to 'RealisticBenchmarks/BaseModels/outputModelSet' and compiles them.

arguments
    inputModelSet (1, :) char
    outputModelSet (1, :) char = [inputModelSet "_compiled"]
end

% Get the path to the RealisticBenchmarks project
realDir = fileparts(which('initRealisticBenchmarks'));

copyfile(fullfile(realDir, 'BaseModels', inputModelSet), ...
         fullfile(realDir, 'BaseModels', outputModelSet));

oldDir = pwd();

cd(fullfile(realDir, 'BaseModels', outputModelSet));

diary('arCompileBaseModels.log');
try
    arCompileAllSetups();
catch
    cd(oldDir);
    error('Error compiling models');
end
diary("off")

cd(oldDir);

end
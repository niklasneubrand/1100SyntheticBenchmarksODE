%% Initialization of realistic simulation algorithm for benchmark generation
% requires Data2Dynamics toolbox. For installation details see:
% https://github.com/Data2Dynamics/d2d/wiki/Installation
homeDir = fullfile(pwd(), '..', '..');
myDir = cd(homeDir);
initRealisticBenchmarks;
cd(myDir);

%% Setup a simulation template
% copy problem definition files
templateDir = fullfile(homeDir, 'BaseModels', 'fast2', 'Crauste_CellSystems2017');
copyfile(templateDir, myDir);

% compile and save the problem
Setup;
saveName = 'Compiled4BenchmarkGeneration';
arSave(saveName);

%% Generate a benchmark using the selected template
benchmarkName = 'Example_Crauste_RS01';
rngSeed = 0000701000;  % seed of Crauste_RS01
arNewRealisticDesign(benchmarkName, rngSeed=rngSeed, loadPattern=saveName);

%% Go to results and plot results
cd(fullfile('RealisticSimulation', benchmarkName));
arLoadLatest('Final');
arPlot;
arGetMerit;

% you can compare the resulting plots with the file:
% \SyntheticBenchmarks\Crauste_CellSystems2017\Crauste_RS01\Crauste_RS01_arPlotFullPage.pdf
% to produce the exact same layout run:
% arPlotFullPage;

% console output of 'arGetMerit' should be:
% 2*log(L) = 553.985, 55 data points, 20 free parameters, data chi^2 = 92.0536
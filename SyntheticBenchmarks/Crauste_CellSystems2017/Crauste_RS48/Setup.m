% Setup File For Realistic Simulation
% Original project:	Crauste_CellSystems2017 
% RS project name:	Crauste_RS48 
% Random seed:		0000748000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Crauste_RS48'); 

% Load the time-course data 
arLoadData('Crauste_RS48_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-10; 
ar.config.rtol = 1.000000e-10; 
ar.config.maxsteps = 100000; 

% Save the project 
arSave('Crauste_RS48__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Crauste_CellSystems2017 
% RS project name:	Crauste_RS01 
% Random seed:		0000701000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Crauste_RS01'); 

% Load the time-course data 
arLoadData('Crauste_RS01_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-10; 
ar.config.rtol = 1.000000e-10; 
ar.config.maxsteps = 100000; 

% Save the project 
arSave('Crauste_RS01__Final', false, true); 


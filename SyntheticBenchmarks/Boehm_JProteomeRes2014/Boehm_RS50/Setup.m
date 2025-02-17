% Setup File For Realistic Simulation
% Original project:	Boehm_JProteomeRes2014 
% RS project name:	Boehm_RS50 
% Random seed:		0000350000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Boehm_RS50'); 

% Load the time-course data 
arLoadData('Boehm_RS50_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 100000; 

% Save the project 
arSave('Boehm_RS50__Final', false, true); 


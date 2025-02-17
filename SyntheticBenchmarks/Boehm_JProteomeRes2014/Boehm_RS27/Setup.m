% Setup File For Realistic Simulation
% Original project:	Boehm_JProteomeRes2014 
% RS project name:	Boehm_RS27 
% Random seed:		0000327000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Boehm_RS27'); 

% Load the time-course data 
arLoadData('Boehm_RS27_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 100000; 

% Save the project 
arSave('Boehm_RS27__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Elowitz_Nature2000 
% RS project name:	Elowitz_RS40 
% Random seed:		0000840000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Elowitz_RS40'); 

% Load the time-course data 
arLoadData('Elowitz_RS40_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.add_c = 60; 

% Save the project 
arSave('Elowitz_RS40__Final', false, true); 


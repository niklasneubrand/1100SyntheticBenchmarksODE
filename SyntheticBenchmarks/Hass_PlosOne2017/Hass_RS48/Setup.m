% Setup File For Realistic Simulation
% Original project:	Hass_PlosOne2017 
% RS project name:	Hass_RS48 
% Random seed:		0001148000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Hass_RS48'); 

% Load the time-course data 
arLoadData('Hass_RS48_TC001', 1); 
arLoadData('Hass_RS48_TC002', 1); 
arLoadData('Hass_RS48_TC003', 1); 
arLoadData('Hass_RS48_TC004', 1); 

% Load the dose-response data 
arLoadData('Hass_RS48_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Hass_RS48__Final', false, true); 


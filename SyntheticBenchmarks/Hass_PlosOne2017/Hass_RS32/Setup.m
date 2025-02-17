% Setup File For Realistic Simulation
% Original project:	Hass_PlosOne2017 
% RS project name:	Hass_RS32 
% Random seed:		0001132000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Hass_RS32'); 

% Load the time-course data 
arLoadData('Hass_RS32_TC001', 1); 
arLoadData('Hass_RS32_TC002', 1); 
arLoadData('Hass_RS32_TC003', 1); 
arLoadData('Hass_RS32_TC004', 1); 

% Load the dose-response data 
arLoadData('Hass_RS32_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atolV = 1; 
ar.config.atolV_Sens = 1; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Hass_RS32__Final', false, true); 


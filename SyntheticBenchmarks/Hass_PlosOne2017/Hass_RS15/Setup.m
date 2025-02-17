% Setup File For Realistic Simulation
% Original project:	Hass_PlosOne2017 
% RS project name:	Hass_RS15 
% Random seed:		0001115000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Hass_RS15'); 

% Load the time-course data 
arLoadData('Hass_RS15_TC001', 1); 
arLoadData('Hass_RS15_TC002', 1); 
arLoadData('Hass_RS15_TC003', 1); 
arLoadData('Hass_RS15_TC004', 1); 

% Load the dose-response data 
arLoadData('Hass_RS15_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atolV = 1; 
ar.config.atolV_Sens = 1; 
ar.config.maxsteps = 100000; 
ar.config.add_c = 60; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Hass_RS15__Final', false, true); 


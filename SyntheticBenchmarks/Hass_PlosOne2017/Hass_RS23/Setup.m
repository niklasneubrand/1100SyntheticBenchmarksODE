% Setup File For Realistic Simulation
% Original project:	Hass_PlosOne2017 
% RS project name:	Hass_RS23 
% Random seed:		0001123000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Hass_RS23'); 

% Load the time-course data 
arLoadData('Hass_RS23_TC001', 1); 
arLoadData('Hass_RS23_TC002', 1); 
arLoadData('Hass_RS23_TC003', 1); 
arLoadData('Hass_RS23_TC004', 1); 

% Load the dose-response data 
arLoadData('Hass_RS23_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atolV = 1; 
ar.config.atolV_Sens = 1; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Hass_RS23__Final', false, true); 


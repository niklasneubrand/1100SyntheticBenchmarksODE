% Setup File For Realistic Simulation
% Original project:	Hass_PlosOne2017 
% RS project name:	Hass_RS37 
% Random seed:		0001137000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Hass_RS37'); 

% Load the time-course data 
arLoadData('Hass_RS37_TC001', 1); 
arLoadData('Hass_RS37_TC002', 1); 
arLoadData('Hass_RS37_TC003', 1); 
arLoadData('Hass_RS37_TC004', 1); 

% Load the dose-response data 
arLoadData('Hass_RS37_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atolV = 1; 
ar.config.atolV_Sens = 1; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Hass_RS37__Final', false, true); 


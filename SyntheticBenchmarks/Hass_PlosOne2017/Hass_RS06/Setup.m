% Setup File For Realistic Simulation
% Original project:	Hass_PlosOne2017 
% RS project name:	Hass_RS06 
% Random seed:		0001106000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Hass_RS06'); 

% Load the time-course data 
arLoadData('Hass_RS06_TC001', 1); 
arLoadData('Hass_RS06_TC002', 1); 
arLoadData('Hass_RS06_TC003', 1); 
arLoadData('Hass_RS06_TC004', 1); 

% Load the dose-response data 
arLoadData('Hass_RS06_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Hass_RS06__Final', false, true); 


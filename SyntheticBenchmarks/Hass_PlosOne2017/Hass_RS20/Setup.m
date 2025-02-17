% Setup File For Realistic Simulation
% Original project:	Hass_PlosOne2017 
% RS project name:	Hass_RS20 
% Random seed:		0001120000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Hass_RS20'); 

% Load the time-course data 
arLoadData('Hass_RS20_TC001', 1); 
arLoadData('Hass_RS20_TC002', 1); 
arLoadData('Hass_RS20_TC003', 1); 
arLoadData('Hass_RS20_TC004', 1); 

% Load the dose-response data 
arLoadData('Hass_RS20_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Hass_RS20__Final', false, true); 


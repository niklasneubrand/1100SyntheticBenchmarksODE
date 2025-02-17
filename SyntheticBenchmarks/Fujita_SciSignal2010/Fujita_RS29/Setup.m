% Setup File For Realistic Simulation
% Original project:	Fujita_SciSignal2010 
% RS project name:	Fujita_RS29 
% Random seed:		0001029000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fujita_RS29'); 

% Load the time-course data 
arLoadData('Fujita_RS29_TC001', 1); 
arLoadData('Fujita_RS29_TC002', 1); 
arLoadData('Fujita_RS29_TC003', 1); 
arLoadData('Fujita_RS29_TC004', 1); 
arLoadData('Fujita_RS29_TC005', 1); 
arLoadData('Fujita_RS29_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Fujita_RS29__Final', false, true); 


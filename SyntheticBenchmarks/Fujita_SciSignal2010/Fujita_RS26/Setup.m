% Setup File For Realistic Simulation
% Original project:	Fujita_SciSignal2010 
% RS project name:	Fujita_RS26 
% Random seed:		0001026000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fujita_RS26'); 

% Load the time-course data 
arLoadData('Fujita_RS26_TC001', 1); 
arLoadData('Fujita_RS26_TC002', 1); 
arLoadData('Fujita_RS26_TC003', 1); 
arLoadData('Fujita_RS26_TC004', 1); 
arLoadData('Fujita_RS26_TC005', 1); 
arLoadData('Fujita_RS26_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Fujita_RS26__Final', false, true); 


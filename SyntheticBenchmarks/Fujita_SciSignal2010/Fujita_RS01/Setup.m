% Setup File For Realistic Simulation
% Original project:	Fujita_SciSignal2010 
% RS project name:	Fujita_RS01 
% Random seed:		0001001000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fujita_RS01'); 

% Load the time-course data 
arLoadData('Fujita_RS01_TC001', 1); 
arLoadData('Fujita_RS01_TC002', 1); 
arLoadData('Fujita_RS01_TC003', 1); 
arLoadData('Fujita_RS01_TC004', 1); 
arLoadData('Fujita_RS01_TC005', 1); 
arLoadData('Fujita_RS01_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Fujita_RS01__Final', false, true); 


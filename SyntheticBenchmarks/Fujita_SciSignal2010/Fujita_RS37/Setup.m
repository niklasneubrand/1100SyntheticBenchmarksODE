% Setup File For Realistic Simulation
% Original project:	Fujita_SciSignal2010 
% RS project name:	Fujita_RS37 
% Random seed:		0001037000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fujita_RS37'); 

% Load the time-course data 
arLoadData('Fujita_RS37_TC001', 1); 
arLoadData('Fujita_RS37_TC002', 1); 
arLoadData('Fujita_RS37_TC003', 1); 
arLoadData('Fujita_RS37_TC004', 1); 
arLoadData('Fujita_RS37_TC005', 1); 
arLoadData('Fujita_RS37_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Fujita_RS37__Final', false, true); 


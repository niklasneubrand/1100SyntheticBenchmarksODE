% Setup File For Realistic Simulation
% Original project:	Weber_BMC2015 
% RS project name:	Weber_RS26 
% Random seed:		0001726000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Weber_RS26'); 

% Load the time-course data 
arLoadData('Weber_RS26_TC001', 1); 
arLoadData('Weber_RS26_TC002', 1); 
arLoadData('Weber_RS26_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-09; 
ar.config.rtol = 1.000000e-09; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Weber_RS26__Final', false, true); 


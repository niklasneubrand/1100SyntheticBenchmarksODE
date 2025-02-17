% Setup File For Realistic Simulation
% Original project:	Weber_BMC2015 
% RS project name:	Weber_RS36 
% Random seed:		0001736000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Weber_RS36'); 

% Load the time-course data 
arLoadData('Weber_RS36_TC001', 1); 
arLoadData('Weber_RS36_TC002', 1); 
arLoadData('Weber_RS36_TC003', 1); 

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
arSave('Weber_RS36__Final', false, true); 


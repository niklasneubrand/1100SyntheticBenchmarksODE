% Setup File For Realistic Simulation
% Original project:	Zheng_PNAS2012 
% RS project name:	Zheng_RS46 
% Random seed:		0001846000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Zheng_RS46'); 

% Load the time-course data 
arLoadData('Zheng_RS46_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, -10000000); 

% Save the project 
arSave('Zheng_RS46__Final', false, true); 


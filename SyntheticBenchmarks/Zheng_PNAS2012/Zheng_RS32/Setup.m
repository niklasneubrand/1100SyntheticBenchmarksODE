% Setup File For Realistic Simulation
% Original project:	Zheng_PNAS2012 
% RS project name:	Zheng_RS32 
% Random seed:		0001832000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Zheng_RS32'); 

% Load the time-course data 
arLoadData('Zheng_RS32_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, -10000000); 

% Save the project 
arSave('Zheng_RS32__Final', false, true); 


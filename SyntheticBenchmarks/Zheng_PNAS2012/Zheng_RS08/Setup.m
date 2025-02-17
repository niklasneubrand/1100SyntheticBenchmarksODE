% Setup File For Realistic Simulation
% Original project:	Zheng_PNAS2012 
% RS project name:	Zheng_RS08 
% Random seed:		0001808000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Zheng_RS08'); 

% Load the time-course data 
arLoadData('Zheng_RS08_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, -10000000); 

% Save the project 
arSave('Zheng_RS08__Final', false, true); 


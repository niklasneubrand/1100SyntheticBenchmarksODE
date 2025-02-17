% Setup File For Realistic Simulation
% Original project:	Brannmark_JBC2010 
% RS project name:	Brannmark_RS03 
% Random seed:		0000503000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Brannmark_RS03'); 

% Load the time-course data 
arLoadData('Brannmark_RS03_TC001', 1); 
arLoadData('Brannmark_RS03_TC002', 1); 

% Load the dose-response data 
arLoadData('Brannmark_RS03_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'DR001', 'insulin_dose_1', 0), 'all', {}, 1); 

% Save the project 
arSave('Brannmark_RS03__Final', false, true); 


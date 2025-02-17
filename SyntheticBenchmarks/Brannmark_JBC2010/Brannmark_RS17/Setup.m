% Setup File For Realistic Simulation
% Original project:	Brannmark_JBC2010 
% RS project name:	Brannmark_RS17 
% Random seed:		0000517000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Brannmark_RS17'); 

% Load the time-course data 
arLoadData('Brannmark_RS17_TC001', 1); 
arLoadData('Brannmark_RS17_TC002', 1); 

% Load the dose-response data 
arLoadData('Brannmark_RS17_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'DR001', 'insulin_dose_1', 0), 'all', {}, 1); 

% Save the project 
arSave('Brannmark_RS17__Final', false, true); 


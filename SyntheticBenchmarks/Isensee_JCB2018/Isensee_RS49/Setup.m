% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS49 
% Random seed:		0002049020 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS49'); 

% Load the time-course data 
arLoadData('Isensee_RS49_TC001', 1); 
arLoadData('Isensee_RS49_TC002', 1); 
arLoadData('Isensee_RS49_TC003', 1); 
arLoadData('Isensee_RS49_TC004', 1); 
arLoadData('Isensee_RS49_TC005', 1); 
arLoadData('Isensee_RS49_TC006', 1); 
arLoadData('Isensee_RS49_TC007', 1); 
arLoadData('Isensee_RS49_TC008', 1); 
arLoadData('Isensee_RS49_TC009', 1); 
arLoadData('Isensee_RS49_TC010', 1); 
arLoadData('Isensee_RS49_TC011', 1); 
arLoadData('Isensee_RS49_TC012', 1); 
arLoadData('Isensee_RS49_TC013', 1); 
arLoadData('Isensee_RS49_TC014', 1); 
arLoadData('Isensee_RS49_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS49_DR001', 1); 
arLoadData('Isensee_RS49_DR002', 1); 
arLoadData('Isensee_RS49_DR003', 1); 
arLoadData('Isensee_RS49_DR004', 1); 
arLoadData('Isensee_RS49_DR005', 1); 
arLoadData('Isensee_RS49_DR006', 1); 
arLoadData('Isensee_RS49_DR007', 1); 
arLoadData('Isensee_RS49_DR008', 1); 
arLoadData('Isensee_RS49_DR009', 1); 
arLoadData('Isensee_RS49_DR010', 1); 
arLoadData('Isensee_RS49_DR011', 1); 
arLoadData('Isensee_RS49_DR012', 1); 
arLoadData('Isensee_RS49_DR013', 1); 
arLoadData('Isensee_RS49_DR014', 1); 
arLoadData('Isensee_RS49_DR015', 1); 
arLoadData('Isensee_RS49_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS49__Final', false, true); 


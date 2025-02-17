% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS02 
% Random seed:		0002002020 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS02'); 

% Load the time-course data 
arLoadData('Isensee_RS02_TC001', 1); 
arLoadData('Isensee_RS02_TC002', 1); 
arLoadData('Isensee_RS02_TC003', 1); 
arLoadData('Isensee_RS02_TC004', 1); 
arLoadData('Isensee_RS02_TC005', 1); 
arLoadData('Isensee_RS02_TC006', 1); 
arLoadData('Isensee_RS02_TC007', 1); 
arLoadData('Isensee_RS02_TC008', 1); 
arLoadData('Isensee_RS02_TC009', 1); 
arLoadData('Isensee_RS02_TC010', 1); 
arLoadData('Isensee_RS02_TC011', 1); 
arLoadData('Isensee_RS02_TC012', 1); 
arLoadData('Isensee_RS02_TC013', 1); 
arLoadData('Isensee_RS02_TC014', 1); 
arLoadData('Isensee_RS02_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS02_DR001', 1); 
arLoadData('Isensee_RS02_DR002', 1); 
arLoadData('Isensee_RS02_DR003', 1); 
arLoadData('Isensee_RS02_DR004', 1); 
arLoadData('Isensee_RS02_DR005', 1); 
arLoadData('Isensee_RS02_DR006', 1); 
arLoadData('Isensee_RS02_DR007', 1); 
arLoadData('Isensee_RS02_DR008', 1); 
arLoadData('Isensee_RS02_DR009', 1); 
arLoadData('Isensee_RS02_DR010', 1); 
arLoadData('Isensee_RS02_DR011', 1); 
arLoadData('Isensee_RS02_DR012', 1); 
arLoadData('Isensee_RS02_DR013', 1); 
arLoadData('Isensee_RS02_DR014', 1); 
arLoadData('Isensee_RS02_DR015', 1); 
arLoadData('Isensee_RS02_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS02__Final', false, true); 


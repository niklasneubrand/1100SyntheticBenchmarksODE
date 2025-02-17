% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS18 
% Random seed:		0002018000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS18'); 

% Load the time-course data 
arLoadData('Isensee_RS18_TC001', 1); 
arLoadData('Isensee_RS18_TC002', 1); 
arLoadData('Isensee_RS18_TC003', 1); 
arLoadData('Isensee_RS18_TC004', 1); 
arLoadData('Isensee_RS18_TC005', 1); 
arLoadData('Isensee_RS18_TC006', 1); 
arLoadData('Isensee_RS18_TC007', 1); 
arLoadData('Isensee_RS18_TC008', 1); 
arLoadData('Isensee_RS18_TC009', 1); 
arLoadData('Isensee_RS18_TC010', 1); 
arLoadData('Isensee_RS18_TC011', 1); 
arLoadData('Isensee_RS18_TC012', 1); 
arLoadData('Isensee_RS18_TC013', 1); 
arLoadData('Isensee_RS18_TC014', 1); 
arLoadData('Isensee_RS18_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS18_DR001', 1); 
arLoadData('Isensee_RS18_DR002', 1); 
arLoadData('Isensee_RS18_DR003', 1); 
arLoadData('Isensee_RS18_DR004', 1); 
arLoadData('Isensee_RS18_DR005', 1); 
arLoadData('Isensee_RS18_DR006', 1); 
arLoadData('Isensee_RS18_DR007', 1); 
arLoadData('Isensee_RS18_DR008', 1); 
arLoadData('Isensee_RS18_DR009', 1); 
arLoadData('Isensee_RS18_DR010', 1); 
arLoadData('Isensee_RS18_DR011', 1); 
arLoadData('Isensee_RS18_DR012', 1); 
arLoadData('Isensee_RS18_DR013', 1); 
arLoadData('Isensee_RS18_DR014', 1); 
arLoadData('Isensee_RS18_DR015', 1); 
arLoadData('Isensee_RS18_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS18__Final', false, true); 


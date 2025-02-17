% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS23 
% Random seed:		0002023000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS23'); 

% Load the time-course data 
arLoadData('Isensee_RS23_TC001', 1); 
arLoadData('Isensee_RS23_TC002', 1); 
arLoadData('Isensee_RS23_TC003', 1); 
arLoadData('Isensee_RS23_TC004', 1); 
arLoadData('Isensee_RS23_TC005', 1); 
arLoadData('Isensee_RS23_TC006', 1); 
arLoadData('Isensee_RS23_TC007', 1); 
arLoadData('Isensee_RS23_TC008', 1); 
arLoadData('Isensee_RS23_TC009', 1); 
arLoadData('Isensee_RS23_TC010', 1); 
arLoadData('Isensee_RS23_TC011', 1); 
arLoadData('Isensee_RS23_TC012', 1); 
arLoadData('Isensee_RS23_TC013', 1); 
arLoadData('Isensee_RS23_TC014', 1); 
arLoadData('Isensee_RS23_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS23_DR001', 1); 
arLoadData('Isensee_RS23_DR002', 1); 
arLoadData('Isensee_RS23_DR003', 1); 
arLoadData('Isensee_RS23_DR004', 1); 
arLoadData('Isensee_RS23_DR005', 1); 
arLoadData('Isensee_RS23_DR006', 1); 
arLoadData('Isensee_RS23_DR007', 1); 
arLoadData('Isensee_RS23_DR008', 1); 
arLoadData('Isensee_RS23_DR009', 1); 
arLoadData('Isensee_RS23_DR010', 1); 
arLoadData('Isensee_RS23_DR011', 1); 
arLoadData('Isensee_RS23_DR012', 1); 
arLoadData('Isensee_RS23_DR013', 1); 
arLoadData('Isensee_RS23_DR014', 1); 
arLoadData('Isensee_RS23_DR015', 1); 
arLoadData('Isensee_RS23_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS23__Final', false, true); 


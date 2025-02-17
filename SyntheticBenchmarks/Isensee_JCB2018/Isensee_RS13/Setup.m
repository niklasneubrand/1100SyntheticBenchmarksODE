% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS13 
% Random seed:		0002013000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS13'); 

% Load the time-course data 
arLoadData('Isensee_RS13_TC001', 1); 
arLoadData('Isensee_RS13_TC002', 1); 
arLoadData('Isensee_RS13_TC003', 1); 
arLoadData('Isensee_RS13_TC004', 1); 
arLoadData('Isensee_RS13_TC005', 1); 
arLoadData('Isensee_RS13_TC006', 1); 
arLoadData('Isensee_RS13_TC007', 1); 
arLoadData('Isensee_RS13_TC008', 1); 
arLoadData('Isensee_RS13_TC009', 1); 
arLoadData('Isensee_RS13_TC010', 1); 
arLoadData('Isensee_RS13_TC011', 1); 
arLoadData('Isensee_RS13_TC012', 1); 
arLoadData('Isensee_RS13_TC013', 1); 
arLoadData('Isensee_RS13_TC014', 1); 
arLoadData('Isensee_RS13_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS13_DR001', 1); 
arLoadData('Isensee_RS13_DR002', 1); 
arLoadData('Isensee_RS13_DR003', 1); 
arLoadData('Isensee_RS13_DR004', 1); 
arLoadData('Isensee_RS13_DR005', 1); 
arLoadData('Isensee_RS13_DR006', 1); 
arLoadData('Isensee_RS13_DR007', 1); 
arLoadData('Isensee_RS13_DR008', 1); 
arLoadData('Isensee_RS13_DR009', 1); 
arLoadData('Isensee_RS13_DR010', 1); 
arLoadData('Isensee_RS13_DR011', 1); 
arLoadData('Isensee_RS13_DR012', 1); 
arLoadData('Isensee_RS13_DR013', 1); 
arLoadData('Isensee_RS13_DR014', 1); 
arLoadData('Isensee_RS13_DR015', 1); 
arLoadData('Isensee_RS13_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS13__Final', false, true); 


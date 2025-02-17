% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS03 
% Random seed:		0002003000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS03'); 

% Load the time-course data 
arLoadData('Isensee_RS03_TC001', 1); 
arLoadData('Isensee_RS03_TC002', 1); 
arLoadData('Isensee_RS03_TC003', 1); 
arLoadData('Isensee_RS03_TC004', 1); 
arLoadData('Isensee_RS03_TC005', 1); 
arLoadData('Isensee_RS03_TC006', 1); 
arLoadData('Isensee_RS03_TC007', 1); 
arLoadData('Isensee_RS03_TC008', 1); 
arLoadData('Isensee_RS03_TC009', 1); 
arLoadData('Isensee_RS03_TC010', 1); 
arLoadData('Isensee_RS03_TC011', 1); 
arLoadData('Isensee_RS03_TC012', 1); 
arLoadData('Isensee_RS03_TC013', 1); 
arLoadData('Isensee_RS03_TC014', 1); 
arLoadData('Isensee_RS03_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS03_DR001', 1); 
arLoadData('Isensee_RS03_DR002', 1); 
arLoadData('Isensee_RS03_DR003', 1); 
arLoadData('Isensee_RS03_DR004', 1); 
arLoadData('Isensee_RS03_DR005', 1); 
arLoadData('Isensee_RS03_DR006', 1); 
arLoadData('Isensee_RS03_DR007', 1); 
arLoadData('Isensee_RS03_DR008', 1); 
arLoadData('Isensee_RS03_DR009', 1); 
arLoadData('Isensee_RS03_DR010', 1); 
arLoadData('Isensee_RS03_DR011', 1); 
arLoadData('Isensee_RS03_DR012', 1); 
arLoadData('Isensee_RS03_DR013', 1); 
arLoadData('Isensee_RS03_DR014', 1); 
arLoadData('Isensee_RS03_DR015', 1); 
arLoadData('Isensee_RS03_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS03__Final', false, true); 


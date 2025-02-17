% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS07 
% Random seed:		0002007010 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS07'); 

% Load the time-course data 
arLoadData('Isensee_RS07_TC001', 1); 
arLoadData('Isensee_RS07_TC002', 1); 
arLoadData('Isensee_RS07_TC003', 1); 
arLoadData('Isensee_RS07_TC004', 1); 
arLoadData('Isensee_RS07_TC005', 1); 
arLoadData('Isensee_RS07_TC006', 1); 
arLoadData('Isensee_RS07_TC007', 1); 
arLoadData('Isensee_RS07_TC008', 1); 
arLoadData('Isensee_RS07_TC009', 1); 
arLoadData('Isensee_RS07_TC010', 1); 
arLoadData('Isensee_RS07_TC011', 1); 
arLoadData('Isensee_RS07_TC012', 1); 
arLoadData('Isensee_RS07_TC013', 1); 
arLoadData('Isensee_RS07_TC014', 1); 
arLoadData('Isensee_RS07_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS07_DR001', 1); 
arLoadData('Isensee_RS07_DR002', 1); 
arLoadData('Isensee_RS07_DR003', 1); 
arLoadData('Isensee_RS07_DR004', 1); 
arLoadData('Isensee_RS07_DR005', 1); 
arLoadData('Isensee_RS07_DR006', 1); 
arLoadData('Isensee_RS07_DR007', 1); 
arLoadData('Isensee_RS07_DR008', 1); 
arLoadData('Isensee_RS07_DR009', 1); 
arLoadData('Isensee_RS07_DR010', 1); 
arLoadData('Isensee_RS07_DR011', 1); 
arLoadData('Isensee_RS07_DR012', 1); 
arLoadData('Isensee_RS07_DR013', 1); 
arLoadData('Isensee_RS07_DR014', 1); 
arLoadData('Isensee_RS07_DR015', 1); 
arLoadData('Isensee_RS07_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS07__Final', false, true); 


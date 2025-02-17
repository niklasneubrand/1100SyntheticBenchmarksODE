% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS29 
% Random seed:		0002029000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS29'); 

% Load the time-course data 
arLoadData('Isensee_RS29_TC001', 1); 
arLoadData('Isensee_RS29_TC002', 1); 
arLoadData('Isensee_RS29_TC003', 1); 
arLoadData('Isensee_RS29_TC004', 1); 
arLoadData('Isensee_RS29_TC005', 1); 
arLoadData('Isensee_RS29_TC006', 1); 
arLoadData('Isensee_RS29_TC007', 1); 
arLoadData('Isensee_RS29_TC008', 1); 
arLoadData('Isensee_RS29_TC009', 1); 
arLoadData('Isensee_RS29_TC010', 1); 
arLoadData('Isensee_RS29_TC011', 1); 
arLoadData('Isensee_RS29_TC012', 1); 
arLoadData('Isensee_RS29_TC013', 1); 
arLoadData('Isensee_RS29_TC014', 1); 
arLoadData('Isensee_RS29_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS29_DR001', 1); 
arLoadData('Isensee_RS29_DR002', 1); 
arLoadData('Isensee_RS29_DR003', 1); 
arLoadData('Isensee_RS29_DR004', 1); 
arLoadData('Isensee_RS29_DR005', 1); 
arLoadData('Isensee_RS29_DR006', 1); 
arLoadData('Isensee_RS29_DR007', 1); 
arLoadData('Isensee_RS29_DR008', 1); 
arLoadData('Isensee_RS29_DR009', 1); 
arLoadData('Isensee_RS29_DR010', 1); 
arLoadData('Isensee_RS29_DR011', 1); 
arLoadData('Isensee_RS29_DR012', 1); 
arLoadData('Isensee_RS29_DR013', 1); 
arLoadData('Isensee_RS29_DR014', 1); 
arLoadData('Isensee_RS29_DR015', 1); 
arLoadData('Isensee_RS29_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS29__Final', false, true); 


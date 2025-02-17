% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS05 
% Random seed:		0002005000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS05'); 

% Load the time-course data 
arLoadData('Isensee_RS05_TC001', 1); 
arLoadData('Isensee_RS05_TC002', 1); 
arLoadData('Isensee_RS05_TC003', 1); 
arLoadData('Isensee_RS05_TC004', 1); 
arLoadData('Isensee_RS05_TC005', 1); 
arLoadData('Isensee_RS05_TC006', 1); 
arLoadData('Isensee_RS05_TC007', 1); 
arLoadData('Isensee_RS05_TC008', 1); 
arLoadData('Isensee_RS05_TC009', 1); 
arLoadData('Isensee_RS05_TC010', 1); 
arLoadData('Isensee_RS05_TC011', 1); 
arLoadData('Isensee_RS05_TC012', 1); 
arLoadData('Isensee_RS05_TC013', 1); 
arLoadData('Isensee_RS05_TC014', 1); 
arLoadData('Isensee_RS05_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS05_DR001', 1); 
arLoadData('Isensee_RS05_DR002', 1); 
arLoadData('Isensee_RS05_DR003', 1); 
arLoadData('Isensee_RS05_DR004', 1); 
arLoadData('Isensee_RS05_DR005', 1); 
arLoadData('Isensee_RS05_DR006', 1); 
arLoadData('Isensee_RS05_DR007', 1); 
arLoadData('Isensee_RS05_DR008', 1); 
arLoadData('Isensee_RS05_DR009', 1); 
arLoadData('Isensee_RS05_DR010', 1); 
arLoadData('Isensee_RS05_DR011', 1); 
arLoadData('Isensee_RS05_DR012', 1); 
arLoadData('Isensee_RS05_DR013', 1); 
arLoadData('Isensee_RS05_DR014', 1); 
arLoadData('Isensee_RS05_DR015', 1); 
arLoadData('Isensee_RS05_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS05__Final', false, true); 


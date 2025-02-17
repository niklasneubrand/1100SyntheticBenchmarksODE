% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS12 
% Random seed:		0002012000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS12'); 

% Load the time-course data 
arLoadData('Isensee_RS12_TC001', 1); 
arLoadData('Isensee_RS12_TC002', 1); 
arLoadData('Isensee_RS12_TC003', 1); 
arLoadData('Isensee_RS12_TC004', 1); 
arLoadData('Isensee_RS12_TC005', 1); 
arLoadData('Isensee_RS12_TC006', 1); 
arLoadData('Isensee_RS12_TC007', 1); 
arLoadData('Isensee_RS12_TC008', 1); 
arLoadData('Isensee_RS12_TC009', 1); 
arLoadData('Isensee_RS12_TC010', 1); 
arLoadData('Isensee_RS12_TC011', 1); 
arLoadData('Isensee_RS12_TC012', 1); 
arLoadData('Isensee_RS12_TC013', 1); 
arLoadData('Isensee_RS12_TC014', 1); 
arLoadData('Isensee_RS12_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS12_DR001', 1); 
arLoadData('Isensee_RS12_DR002', 1); 
arLoadData('Isensee_RS12_DR003', 1); 
arLoadData('Isensee_RS12_DR004', 1); 
arLoadData('Isensee_RS12_DR005', 1); 
arLoadData('Isensee_RS12_DR006', 1); 
arLoadData('Isensee_RS12_DR007', 1); 
arLoadData('Isensee_RS12_DR008', 1); 
arLoadData('Isensee_RS12_DR009', 1); 
arLoadData('Isensee_RS12_DR010', 1); 
arLoadData('Isensee_RS12_DR011', 1); 
arLoadData('Isensee_RS12_DR012', 1); 
arLoadData('Isensee_RS12_DR013', 1); 
arLoadData('Isensee_RS12_DR014', 1); 
arLoadData('Isensee_RS12_DR015', 1); 
arLoadData('Isensee_RS12_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS12__Final', false, true); 


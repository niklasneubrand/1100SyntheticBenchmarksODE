% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS41 
% Random seed:		0002041020 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS41'); 

% Load the time-course data 
arLoadData('Isensee_RS41_TC001', 1); 
arLoadData('Isensee_RS41_TC002', 1); 
arLoadData('Isensee_RS41_TC003', 1); 
arLoadData('Isensee_RS41_TC004', 1); 
arLoadData('Isensee_RS41_TC005', 1); 
arLoadData('Isensee_RS41_TC006', 1); 
arLoadData('Isensee_RS41_TC007', 1); 
arLoadData('Isensee_RS41_TC008', 1); 
arLoadData('Isensee_RS41_TC009', 1); 
arLoadData('Isensee_RS41_TC010', 1); 
arLoadData('Isensee_RS41_TC011', 1); 
arLoadData('Isensee_RS41_TC012', 1); 
arLoadData('Isensee_RS41_TC013', 1); 
arLoadData('Isensee_RS41_TC014', 1); 
arLoadData('Isensee_RS41_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS41_DR001', 1); 
arLoadData('Isensee_RS41_DR002', 1); 
arLoadData('Isensee_RS41_DR003', 1); 
arLoadData('Isensee_RS41_DR004', 1); 
arLoadData('Isensee_RS41_DR005', 1); 
arLoadData('Isensee_RS41_DR006', 1); 
arLoadData('Isensee_RS41_DR007', 1); 
arLoadData('Isensee_RS41_DR008', 1); 
arLoadData('Isensee_RS41_DR009', 1); 
arLoadData('Isensee_RS41_DR010', 1); 
arLoadData('Isensee_RS41_DR011', 1); 
arLoadData('Isensee_RS41_DR012', 1); 
arLoadData('Isensee_RS41_DR013', 1); 
arLoadData('Isensee_RS41_DR014', 1); 
arLoadData('Isensee_RS41_DR015', 1); 
arLoadData('Isensee_RS41_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS41__Final', false, true); 


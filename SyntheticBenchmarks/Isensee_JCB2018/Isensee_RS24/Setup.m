% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS24 
% Random seed:		0002024000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS24'); 

% Load the time-course data 
arLoadData('Isensee_RS24_TC001', 1); 
arLoadData('Isensee_RS24_TC002', 1); 
arLoadData('Isensee_RS24_TC003', 1); 
arLoadData('Isensee_RS24_TC004', 1); 
arLoadData('Isensee_RS24_TC005', 1); 
arLoadData('Isensee_RS24_TC006', 1); 
arLoadData('Isensee_RS24_TC007', 1); 
arLoadData('Isensee_RS24_TC008', 1); 
arLoadData('Isensee_RS24_TC009', 1); 
arLoadData('Isensee_RS24_TC010', 1); 
arLoadData('Isensee_RS24_TC011', 1); 
arLoadData('Isensee_RS24_TC012', 1); 
arLoadData('Isensee_RS24_TC013', 1); 
arLoadData('Isensee_RS24_TC014', 1); 
arLoadData('Isensee_RS24_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS24_DR001', 1); 
arLoadData('Isensee_RS24_DR002', 1); 
arLoadData('Isensee_RS24_DR003', 1); 
arLoadData('Isensee_RS24_DR004', 1); 
arLoadData('Isensee_RS24_DR005', 1); 
arLoadData('Isensee_RS24_DR006', 1); 
arLoadData('Isensee_RS24_DR007', 1); 
arLoadData('Isensee_RS24_DR008', 1); 
arLoadData('Isensee_RS24_DR009', 1); 
arLoadData('Isensee_RS24_DR010', 1); 
arLoadData('Isensee_RS24_DR011', 1); 
arLoadData('Isensee_RS24_DR012', 1); 
arLoadData('Isensee_RS24_DR013', 1); 
arLoadData('Isensee_RS24_DR014', 1); 
arLoadData('Isensee_RS24_DR015', 1); 
arLoadData('Isensee_RS24_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS24__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS26 
% Random seed:		0002026000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS26'); 

% Load the time-course data 
arLoadData('Isensee_RS26_TC001', 1); 
arLoadData('Isensee_RS26_TC002', 1); 
arLoadData('Isensee_RS26_TC003', 1); 
arLoadData('Isensee_RS26_TC004', 1); 
arLoadData('Isensee_RS26_TC005', 1); 
arLoadData('Isensee_RS26_TC006', 1); 
arLoadData('Isensee_RS26_TC007', 1); 
arLoadData('Isensee_RS26_TC008', 1); 
arLoadData('Isensee_RS26_TC009', 1); 
arLoadData('Isensee_RS26_TC010', 1); 
arLoadData('Isensee_RS26_TC011', 1); 
arLoadData('Isensee_RS26_TC012', 1); 
arLoadData('Isensee_RS26_TC013', 1); 
arLoadData('Isensee_RS26_TC014', 1); 
arLoadData('Isensee_RS26_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS26_DR001', 1); 
arLoadData('Isensee_RS26_DR002', 1); 
arLoadData('Isensee_RS26_DR003', 1); 
arLoadData('Isensee_RS26_DR004', 1); 
arLoadData('Isensee_RS26_DR005', 1); 
arLoadData('Isensee_RS26_DR006', 1); 
arLoadData('Isensee_RS26_DR007', 1); 
arLoadData('Isensee_RS26_DR008', 1); 
arLoadData('Isensee_RS26_DR009', 1); 
arLoadData('Isensee_RS26_DR010', 1); 
arLoadData('Isensee_RS26_DR011', 1); 
arLoadData('Isensee_RS26_DR012', 1); 
arLoadData('Isensee_RS26_DR013', 1); 
arLoadData('Isensee_RS26_DR014', 1); 
arLoadData('Isensee_RS26_DR015', 1); 
arLoadData('Isensee_RS26_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS26__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS45 
% Random seed:		0002045000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS45'); 

% Load the time-course data 
arLoadData('Isensee_RS45_TC001', 1); 
arLoadData('Isensee_RS45_TC002', 1); 
arLoadData('Isensee_RS45_TC003', 1); 
arLoadData('Isensee_RS45_TC004', 1); 
arLoadData('Isensee_RS45_TC005', 1); 
arLoadData('Isensee_RS45_TC006', 1); 
arLoadData('Isensee_RS45_TC007', 1); 
arLoadData('Isensee_RS45_TC008', 1); 
arLoadData('Isensee_RS45_TC009', 1); 
arLoadData('Isensee_RS45_TC010', 1); 
arLoadData('Isensee_RS45_TC011', 1); 
arLoadData('Isensee_RS45_TC012', 1); 
arLoadData('Isensee_RS45_TC013', 1); 
arLoadData('Isensee_RS45_TC014', 1); 
arLoadData('Isensee_RS45_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS45_DR001', 1); 
arLoadData('Isensee_RS45_DR002', 1); 
arLoadData('Isensee_RS45_DR003', 1); 
arLoadData('Isensee_RS45_DR004', 1); 
arLoadData('Isensee_RS45_DR005', 1); 
arLoadData('Isensee_RS45_DR006', 1); 
arLoadData('Isensee_RS45_DR007', 1); 
arLoadData('Isensee_RS45_DR008', 1); 
arLoadData('Isensee_RS45_DR009', 1); 
arLoadData('Isensee_RS45_DR010', 1); 
arLoadData('Isensee_RS45_DR011', 1); 
arLoadData('Isensee_RS45_DR012', 1); 
arLoadData('Isensee_RS45_DR013', 1); 
arLoadData('Isensee_RS45_DR014', 1); 
arLoadData('Isensee_RS45_DR015', 1); 
arLoadData('Isensee_RS45_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS45__Final', false, true); 


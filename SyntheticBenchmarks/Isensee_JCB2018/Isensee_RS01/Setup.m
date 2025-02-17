% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS01 
% Random seed:		0002001000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS01'); 

% Load the time-course data 
arLoadData('Isensee_RS01_TC001', 1); 
arLoadData('Isensee_RS01_TC002', 1); 
arLoadData('Isensee_RS01_TC003', 1); 
arLoadData('Isensee_RS01_TC004', 1); 
arLoadData('Isensee_RS01_TC005', 1); 
arLoadData('Isensee_RS01_TC006', 1); 
arLoadData('Isensee_RS01_TC007', 1); 
arLoadData('Isensee_RS01_TC008', 1); 
arLoadData('Isensee_RS01_TC009', 1); 
arLoadData('Isensee_RS01_TC010', 1); 
arLoadData('Isensee_RS01_TC011', 1); 
arLoadData('Isensee_RS01_TC012', 1); 
arLoadData('Isensee_RS01_TC013', 1); 
arLoadData('Isensee_RS01_TC014', 1); 
arLoadData('Isensee_RS01_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS01_DR001', 1); 
arLoadData('Isensee_RS01_DR002', 1); 
arLoadData('Isensee_RS01_DR003', 1); 
arLoadData('Isensee_RS01_DR004', 1); 
arLoadData('Isensee_RS01_DR005', 1); 
arLoadData('Isensee_RS01_DR006', 1); 
arLoadData('Isensee_RS01_DR007', 1); 
arLoadData('Isensee_RS01_DR008', 1); 
arLoadData('Isensee_RS01_DR009', 1); 
arLoadData('Isensee_RS01_DR010', 1); 
arLoadData('Isensee_RS01_DR011', 1); 
arLoadData('Isensee_RS01_DR012', 1); 
arLoadData('Isensee_RS01_DR013', 1); 
arLoadData('Isensee_RS01_DR014', 1); 
arLoadData('Isensee_RS01_DR015', 1); 
arLoadData('Isensee_RS01_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS01__Final', false, true); 


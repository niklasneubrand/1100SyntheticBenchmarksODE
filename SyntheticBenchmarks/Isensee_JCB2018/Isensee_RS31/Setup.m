% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS31 
% Random seed:		0002031010 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS31'); 

% Load the time-course data 
arLoadData('Isensee_RS31_TC001', 1); 
arLoadData('Isensee_RS31_TC002', 1); 
arLoadData('Isensee_RS31_TC003', 1); 
arLoadData('Isensee_RS31_TC004', 1); 
arLoadData('Isensee_RS31_TC005', 1); 
arLoadData('Isensee_RS31_TC006', 1); 
arLoadData('Isensee_RS31_TC007', 1); 
arLoadData('Isensee_RS31_TC008', 1); 
arLoadData('Isensee_RS31_TC009', 1); 
arLoadData('Isensee_RS31_TC010', 1); 
arLoadData('Isensee_RS31_TC011', 1); 
arLoadData('Isensee_RS31_TC012', 1); 
arLoadData('Isensee_RS31_TC013', 1); 
arLoadData('Isensee_RS31_TC014', 1); 
arLoadData('Isensee_RS31_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS31_DR001', 1); 
arLoadData('Isensee_RS31_DR002', 1); 
arLoadData('Isensee_RS31_DR003', 1); 
arLoadData('Isensee_RS31_DR004', 1); 
arLoadData('Isensee_RS31_DR005', 1); 
arLoadData('Isensee_RS31_DR006', 1); 
arLoadData('Isensee_RS31_DR007', 1); 
arLoadData('Isensee_RS31_DR008', 1); 
arLoadData('Isensee_RS31_DR009', 1); 
arLoadData('Isensee_RS31_DR010', 1); 
arLoadData('Isensee_RS31_DR011', 1); 
arLoadData('Isensee_RS31_DR012', 1); 
arLoadData('Isensee_RS31_DR013', 1); 
arLoadData('Isensee_RS31_DR014', 1); 
arLoadData('Isensee_RS31_DR015', 1); 
arLoadData('Isensee_RS31_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS31__Final', false, true); 


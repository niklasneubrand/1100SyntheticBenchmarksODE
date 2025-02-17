% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS15 
% Random seed:		0002015000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS15'); 

% Load the time-course data 
arLoadData('Isensee_RS15_TC001', 1); 
arLoadData('Isensee_RS15_TC002', 1); 
arLoadData('Isensee_RS15_TC003', 1); 
arLoadData('Isensee_RS15_TC004', 1); 
arLoadData('Isensee_RS15_TC005', 1); 
arLoadData('Isensee_RS15_TC006', 1); 
arLoadData('Isensee_RS15_TC007', 1); 
arLoadData('Isensee_RS15_TC008', 1); 
arLoadData('Isensee_RS15_TC009', 1); 
arLoadData('Isensee_RS15_TC010', 1); 
arLoadData('Isensee_RS15_TC011', 1); 
arLoadData('Isensee_RS15_TC012', 1); 
arLoadData('Isensee_RS15_TC013', 1); 
arLoadData('Isensee_RS15_TC014', 1); 
arLoadData('Isensee_RS15_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS15_DR001', 1); 
arLoadData('Isensee_RS15_DR002', 1); 
arLoadData('Isensee_RS15_DR003', 1); 
arLoadData('Isensee_RS15_DR004', 1); 
arLoadData('Isensee_RS15_DR005', 1); 
arLoadData('Isensee_RS15_DR006', 1); 
arLoadData('Isensee_RS15_DR007', 1); 
arLoadData('Isensee_RS15_DR008', 1); 
arLoadData('Isensee_RS15_DR009', 1); 
arLoadData('Isensee_RS15_DR010', 1); 
arLoadData('Isensee_RS15_DR011', 1); 
arLoadData('Isensee_RS15_DR012', 1); 
arLoadData('Isensee_RS15_DR013', 1); 
arLoadData('Isensee_RS15_DR014', 1); 
arLoadData('Isensee_RS15_DR015', 1); 
arLoadData('Isensee_RS15_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS15__Final', false, true); 


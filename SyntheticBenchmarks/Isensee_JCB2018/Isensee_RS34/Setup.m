% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS34 
% Random seed:		0002034000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS34'); 

% Load the time-course data 
arLoadData('Isensee_RS34_TC001', 1); 
arLoadData('Isensee_RS34_TC002', 1); 
arLoadData('Isensee_RS34_TC003', 1); 
arLoadData('Isensee_RS34_TC004', 1); 
arLoadData('Isensee_RS34_TC005', 1); 
arLoadData('Isensee_RS34_TC006', 1); 
arLoadData('Isensee_RS34_TC007', 1); 
arLoadData('Isensee_RS34_TC008', 1); 
arLoadData('Isensee_RS34_TC009', 1); 
arLoadData('Isensee_RS34_TC010', 1); 
arLoadData('Isensee_RS34_TC011', 1); 
arLoadData('Isensee_RS34_TC012', 1); 
arLoadData('Isensee_RS34_TC013', 1); 
arLoadData('Isensee_RS34_TC014', 1); 
arLoadData('Isensee_RS34_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS34_DR001', 1); 
arLoadData('Isensee_RS34_DR002', 1); 
arLoadData('Isensee_RS34_DR003', 1); 
arLoadData('Isensee_RS34_DR004', 1); 
arLoadData('Isensee_RS34_DR005', 1); 
arLoadData('Isensee_RS34_DR006', 1); 
arLoadData('Isensee_RS34_DR007', 1); 
arLoadData('Isensee_RS34_DR008', 1); 
arLoadData('Isensee_RS34_DR009', 1); 
arLoadData('Isensee_RS34_DR010', 1); 
arLoadData('Isensee_RS34_DR011', 1); 
arLoadData('Isensee_RS34_DR012', 1); 
arLoadData('Isensee_RS34_DR013', 1); 
arLoadData('Isensee_RS34_DR014', 1); 
arLoadData('Isensee_RS34_DR015', 1); 
arLoadData('Isensee_RS34_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS34__Final', false, true); 


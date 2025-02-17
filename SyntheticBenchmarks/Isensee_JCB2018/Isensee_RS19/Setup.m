% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS19 
% Random seed:		0002019000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS19'); 

% Load the time-course data 
arLoadData('Isensee_RS19_TC001', 1); 
arLoadData('Isensee_RS19_TC002', 1); 
arLoadData('Isensee_RS19_TC003', 1); 
arLoadData('Isensee_RS19_TC004', 1); 
arLoadData('Isensee_RS19_TC005', 1); 
arLoadData('Isensee_RS19_TC006', 1); 
arLoadData('Isensee_RS19_TC007', 1); 
arLoadData('Isensee_RS19_TC008', 1); 
arLoadData('Isensee_RS19_TC009', 1); 
arLoadData('Isensee_RS19_TC010', 1); 
arLoadData('Isensee_RS19_TC011', 1); 
arLoadData('Isensee_RS19_TC012', 1); 
arLoadData('Isensee_RS19_TC013', 1); 
arLoadData('Isensee_RS19_TC014', 1); 
arLoadData('Isensee_RS19_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS19_DR001', 1); 
arLoadData('Isensee_RS19_DR002', 1); 
arLoadData('Isensee_RS19_DR003', 1); 
arLoadData('Isensee_RS19_DR004', 1); 
arLoadData('Isensee_RS19_DR005', 1); 
arLoadData('Isensee_RS19_DR006', 1); 
arLoadData('Isensee_RS19_DR007', 1); 
arLoadData('Isensee_RS19_DR008', 1); 
arLoadData('Isensee_RS19_DR009', 1); 
arLoadData('Isensee_RS19_DR010', 1); 
arLoadData('Isensee_RS19_DR011', 1); 
arLoadData('Isensee_RS19_DR012', 1); 
arLoadData('Isensee_RS19_DR013', 1); 
arLoadData('Isensee_RS19_DR014', 1); 
arLoadData('Isensee_RS19_DR015', 1); 
arLoadData('Isensee_RS19_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS19__Final', false, true); 


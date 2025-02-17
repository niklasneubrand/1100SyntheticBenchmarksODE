% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS50 
% Random seed:		0002050000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS50'); 

% Load the time-course data 
arLoadData('Isensee_RS50_TC001', 1); 
arLoadData('Isensee_RS50_TC002', 1); 
arLoadData('Isensee_RS50_TC003', 1); 
arLoadData('Isensee_RS50_TC004', 1); 
arLoadData('Isensee_RS50_TC005', 1); 
arLoadData('Isensee_RS50_TC006', 1); 
arLoadData('Isensee_RS50_TC007', 1); 
arLoadData('Isensee_RS50_TC008', 1); 
arLoadData('Isensee_RS50_TC009', 1); 
arLoadData('Isensee_RS50_TC010', 1); 
arLoadData('Isensee_RS50_TC011', 1); 
arLoadData('Isensee_RS50_TC012', 1); 
arLoadData('Isensee_RS50_TC013', 1); 
arLoadData('Isensee_RS50_TC014', 1); 
arLoadData('Isensee_RS50_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS50_DR001', 1); 
arLoadData('Isensee_RS50_DR002', 1); 
arLoadData('Isensee_RS50_DR003', 1); 
arLoadData('Isensee_RS50_DR004', 1); 
arLoadData('Isensee_RS50_DR005', 1); 
arLoadData('Isensee_RS50_DR006', 1); 
arLoadData('Isensee_RS50_DR007', 1); 
arLoadData('Isensee_RS50_DR008', 1); 
arLoadData('Isensee_RS50_DR009', 1); 
arLoadData('Isensee_RS50_DR010', 1); 
arLoadData('Isensee_RS50_DR011', 1); 
arLoadData('Isensee_RS50_DR012', 1); 
arLoadData('Isensee_RS50_DR013', 1); 
arLoadData('Isensee_RS50_DR014', 1); 
arLoadData('Isensee_RS50_DR015', 1); 
arLoadData('Isensee_RS50_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS50__Final', false, true); 


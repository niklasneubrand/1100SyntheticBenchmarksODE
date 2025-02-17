% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS47 
% Random seed:		0002047000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS47'); 

% Load the time-course data 
arLoadData('Isensee_RS47_TC001', 1); 
arLoadData('Isensee_RS47_TC002', 1); 
arLoadData('Isensee_RS47_TC003', 1); 
arLoadData('Isensee_RS47_TC004', 1); 
arLoadData('Isensee_RS47_TC005', 1); 
arLoadData('Isensee_RS47_TC006', 1); 
arLoadData('Isensee_RS47_TC007', 1); 
arLoadData('Isensee_RS47_TC008', 1); 
arLoadData('Isensee_RS47_TC009', 1); 
arLoadData('Isensee_RS47_TC010', 1); 
arLoadData('Isensee_RS47_TC011', 1); 
arLoadData('Isensee_RS47_TC012', 1); 
arLoadData('Isensee_RS47_TC013', 1); 
arLoadData('Isensee_RS47_TC014', 1); 
arLoadData('Isensee_RS47_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS47_DR001', 1); 
arLoadData('Isensee_RS47_DR002', 1); 
arLoadData('Isensee_RS47_DR003', 1); 
arLoadData('Isensee_RS47_DR004', 1); 
arLoadData('Isensee_RS47_DR005', 1); 
arLoadData('Isensee_RS47_DR006', 1); 
arLoadData('Isensee_RS47_DR007', 1); 
arLoadData('Isensee_RS47_DR008', 1); 
arLoadData('Isensee_RS47_DR009', 1); 
arLoadData('Isensee_RS47_DR010', 1); 
arLoadData('Isensee_RS47_DR011', 1); 
arLoadData('Isensee_RS47_DR012', 1); 
arLoadData('Isensee_RS47_DR013', 1); 
arLoadData('Isensee_RS47_DR014', 1); 
arLoadData('Isensee_RS47_DR015', 1); 
arLoadData('Isensee_RS47_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS47__Final', false, true); 


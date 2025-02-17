% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS09 
% Random seed:		0002009000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS09'); 

% Load the time-course data 
arLoadData('Isensee_RS09_TC001', 1); 
arLoadData('Isensee_RS09_TC002', 1); 
arLoadData('Isensee_RS09_TC003', 1); 
arLoadData('Isensee_RS09_TC004', 1); 
arLoadData('Isensee_RS09_TC005', 1); 
arLoadData('Isensee_RS09_TC006', 1); 
arLoadData('Isensee_RS09_TC007', 1); 
arLoadData('Isensee_RS09_TC008', 1); 
arLoadData('Isensee_RS09_TC009', 1); 
arLoadData('Isensee_RS09_TC010', 1); 
arLoadData('Isensee_RS09_TC011', 1); 
arLoadData('Isensee_RS09_TC012', 1); 
arLoadData('Isensee_RS09_TC013', 1); 
arLoadData('Isensee_RS09_TC014', 1); 
arLoadData('Isensee_RS09_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS09_DR001', 1); 
arLoadData('Isensee_RS09_DR002', 1); 
arLoadData('Isensee_RS09_DR003', 1); 
arLoadData('Isensee_RS09_DR004', 1); 
arLoadData('Isensee_RS09_DR005', 1); 
arLoadData('Isensee_RS09_DR006', 1); 
arLoadData('Isensee_RS09_DR007', 1); 
arLoadData('Isensee_RS09_DR008', 1); 
arLoadData('Isensee_RS09_DR009', 1); 
arLoadData('Isensee_RS09_DR010', 1); 
arLoadData('Isensee_RS09_DR011', 1); 
arLoadData('Isensee_RS09_DR012', 1); 
arLoadData('Isensee_RS09_DR013', 1); 
arLoadData('Isensee_RS09_DR014', 1); 
arLoadData('Isensee_RS09_DR015', 1); 
arLoadData('Isensee_RS09_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS09__Final', false, true); 


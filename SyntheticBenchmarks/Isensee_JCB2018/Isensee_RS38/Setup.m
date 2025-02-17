% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS38 
% Random seed:		0002038000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS38'); 

% Load the time-course data 
arLoadData('Isensee_RS38_TC001', 1); 
arLoadData('Isensee_RS38_TC002', 1); 
arLoadData('Isensee_RS38_TC003', 1); 
arLoadData('Isensee_RS38_TC004', 1); 
arLoadData('Isensee_RS38_TC005', 1); 
arLoadData('Isensee_RS38_TC006', 1); 
arLoadData('Isensee_RS38_TC007', 1); 
arLoadData('Isensee_RS38_TC008', 1); 
arLoadData('Isensee_RS38_TC009', 1); 
arLoadData('Isensee_RS38_TC010', 1); 
arLoadData('Isensee_RS38_TC011', 1); 
arLoadData('Isensee_RS38_TC012', 1); 
arLoadData('Isensee_RS38_TC013', 1); 
arLoadData('Isensee_RS38_TC014', 1); 
arLoadData('Isensee_RS38_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS38_DR001', 1); 
arLoadData('Isensee_RS38_DR002', 1); 
arLoadData('Isensee_RS38_DR003', 1); 
arLoadData('Isensee_RS38_DR004', 1); 
arLoadData('Isensee_RS38_DR005', 1); 
arLoadData('Isensee_RS38_DR006', 1); 
arLoadData('Isensee_RS38_DR007', 1); 
arLoadData('Isensee_RS38_DR008', 1); 
arLoadData('Isensee_RS38_DR009', 1); 
arLoadData('Isensee_RS38_DR010', 1); 
arLoadData('Isensee_RS38_DR011', 1); 
arLoadData('Isensee_RS38_DR012', 1); 
arLoadData('Isensee_RS38_DR013', 1); 
arLoadData('Isensee_RS38_DR014', 1); 
arLoadData('Isensee_RS38_DR015', 1); 
arLoadData('Isensee_RS38_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS38__Final', false, true); 


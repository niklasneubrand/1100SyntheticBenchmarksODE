% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS14 
% Random seed:		0002014000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS14'); 

% Load the time-course data 
arLoadData('Isensee_RS14_TC001', 1); 
arLoadData('Isensee_RS14_TC002', 1); 
arLoadData('Isensee_RS14_TC003', 1); 
arLoadData('Isensee_RS14_TC004', 1); 
arLoadData('Isensee_RS14_TC005', 1); 
arLoadData('Isensee_RS14_TC006', 1); 
arLoadData('Isensee_RS14_TC007', 1); 
arLoadData('Isensee_RS14_TC008', 1); 
arLoadData('Isensee_RS14_TC009', 1); 
arLoadData('Isensee_RS14_TC010', 1); 
arLoadData('Isensee_RS14_TC011', 1); 
arLoadData('Isensee_RS14_TC012', 1); 
arLoadData('Isensee_RS14_TC013', 1); 
arLoadData('Isensee_RS14_TC014', 1); 
arLoadData('Isensee_RS14_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS14_DR001', 1); 
arLoadData('Isensee_RS14_DR002', 1); 
arLoadData('Isensee_RS14_DR003', 1); 
arLoadData('Isensee_RS14_DR004', 1); 
arLoadData('Isensee_RS14_DR005', 1); 
arLoadData('Isensee_RS14_DR006', 1); 
arLoadData('Isensee_RS14_DR007', 1); 
arLoadData('Isensee_RS14_DR008', 1); 
arLoadData('Isensee_RS14_DR009', 1); 
arLoadData('Isensee_RS14_DR010', 1); 
arLoadData('Isensee_RS14_DR011', 1); 
arLoadData('Isensee_RS14_DR012', 1); 
arLoadData('Isensee_RS14_DR013', 1); 
arLoadData('Isensee_RS14_DR014', 1); 
arLoadData('Isensee_RS14_DR015', 1); 
arLoadData('Isensee_RS14_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS14__Final', false, true); 


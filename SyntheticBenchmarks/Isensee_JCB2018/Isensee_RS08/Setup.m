% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS08 
% Random seed:		0002008000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS08'); 

% Load the time-course data 
arLoadData('Isensee_RS08_TC001', 1); 
arLoadData('Isensee_RS08_TC002', 1); 
arLoadData('Isensee_RS08_TC003', 1); 
arLoadData('Isensee_RS08_TC004', 1); 
arLoadData('Isensee_RS08_TC005', 1); 
arLoadData('Isensee_RS08_TC006', 1); 
arLoadData('Isensee_RS08_TC007', 1); 
arLoadData('Isensee_RS08_TC008', 1); 
arLoadData('Isensee_RS08_TC009', 1); 
arLoadData('Isensee_RS08_TC010', 1); 
arLoadData('Isensee_RS08_TC011', 1); 
arLoadData('Isensee_RS08_TC012', 1); 
arLoadData('Isensee_RS08_TC013', 1); 
arLoadData('Isensee_RS08_TC014', 1); 
arLoadData('Isensee_RS08_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS08_DR001', 1); 
arLoadData('Isensee_RS08_DR002', 1); 
arLoadData('Isensee_RS08_DR003', 1); 
arLoadData('Isensee_RS08_DR004', 1); 
arLoadData('Isensee_RS08_DR005', 1); 
arLoadData('Isensee_RS08_DR006', 1); 
arLoadData('Isensee_RS08_DR007', 1); 
arLoadData('Isensee_RS08_DR008', 1); 
arLoadData('Isensee_RS08_DR009', 1); 
arLoadData('Isensee_RS08_DR010', 1); 
arLoadData('Isensee_RS08_DR011', 1); 
arLoadData('Isensee_RS08_DR012', 1); 
arLoadData('Isensee_RS08_DR013', 1); 
arLoadData('Isensee_RS08_DR014', 1); 
arLoadData('Isensee_RS08_DR015', 1); 
arLoadData('Isensee_RS08_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS08__Final', false, true); 


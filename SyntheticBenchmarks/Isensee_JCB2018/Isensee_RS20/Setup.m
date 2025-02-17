% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS20 
% Random seed:		0002020000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS20'); 

% Load the time-course data 
arLoadData('Isensee_RS20_TC001', 1); 
arLoadData('Isensee_RS20_TC002', 1); 
arLoadData('Isensee_RS20_TC003', 1); 
arLoadData('Isensee_RS20_TC004', 1); 
arLoadData('Isensee_RS20_TC005', 1); 
arLoadData('Isensee_RS20_TC006', 1); 
arLoadData('Isensee_RS20_TC007', 1); 
arLoadData('Isensee_RS20_TC008', 1); 
arLoadData('Isensee_RS20_TC009', 1); 
arLoadData('Isensee_RS20_TC010', 1); 
arLoadData('Isensee_RS20_TC011', 1); 
arLoadData('Isensee_RS20_TC012', 1); 
arLoadData('Isensee_RS20_TC013', 1); 
arLoadData('Isensee_RS20_TC014', 1); 
arLoadData('Isensee_RS20_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS20_DR001', 1); 
arLoadData('Isensee_RS20_DR002', 1); 
arLoadData('Isensee_RS20_DR003', 1); 
arLoadData('Isensee_RS20_DR004', 1); 
arLoadData('Isensee_RS20_DR005', 1); 
arLoadData('Isensee_RS20_DR006', 1); 
arLoadData('Isensee_RS20_DR007', 1); 
arLoadData('Isensee_RS20_DR008', 1); 
arLoadData('Isensee_RS20_DR009', 1); 
arLoadData('Isensee_RS20_DR010', 1); 
arLoadData('Isensee_RS20_DR011', 1); 
arLoadData('Isensee_RS20_DR012', 1); 
arLoadData('Isensee_RS20_DR013', 1); 
arLoadData('Isensee_RS20_DR014', 1); 
arLoadData('Isensee_RS20_DR015', 1); 
arLoadData('Isensee_RS20_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS20__Final', false, true); 


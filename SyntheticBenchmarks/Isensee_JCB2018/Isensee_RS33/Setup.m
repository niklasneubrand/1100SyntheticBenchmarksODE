% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS33 
% Random seed:		0002033020 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS33'); 

% Load the time-course data 
arLoadData('Isensee_RS33_TC001', 1); 
arLoadData('Isensee_RS33_TC002', 1); 
arLoadData('Isensee_RS33_TC003', 1); 
arLoadData('Isensee_RS33_TC004', 1); 
arLoadData('Isensee_RS33_TC005', 1); 
arLoadData('Isensee_RS33_TC006', 1); 
arLoadData('Isensee_RS33_TC007', 1); 
arLoadData('Isensee_RS33_TC008', 1); 
arLoadData('Isensee_RS33_TC009', 1); 
arLoadData('Isensee_RS33_TC010', 1); 
arLoadData('Isensee_RS33_TC011', 1); 
arLoadData('Isensee_RS33_TC012', 1); 
arLoadData('Isensee_RS33_TC013', 1); 
arLoadData('Isensee_RS33_TC014', 1); 
arLoadData('Isensee_RS33_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS33_DR001', 1); 
arLoadData('Isensee_RS33_DR002', 1); 
arLoadData('Isensee_RS33_DR003', 1); 
arLoadData('Isensee_RS33_DR004', 1); 
arLoadData('Isensee_RS33_DR005', 1); 
arLoadData('Isensee_RS33_DR006', 1); 
arLoadData('Isensee_RS33_DR007', 1); 
arLoadData('Isensee_RS33_DR008', 1); 
arLoadData('Isensee_RS33_DR009', 1); 
arLoadData('Isensee_RS33_DR010', 1); 
arLoadData('Isensee_RS33_DR011', 1); 
arLoadData('Isensee_RS33_DR012', 1); 
arLoadData('Isensee_RS33_DR013', 1); 
arLoadData('Isensee_RS33_DR014', 1); 
arLoadData('Isensee_RS33_DR015', 1); 
arLoadData('Isensee_RS33_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS33__Final', false, true); 


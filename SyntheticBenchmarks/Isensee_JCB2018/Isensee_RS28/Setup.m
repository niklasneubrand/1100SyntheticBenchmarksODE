% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS28 
% Random seed:		0002028000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS28'); 

% Load the time-course data 
arLoadData('Isensee_RS28_TC001', 1); 
arLoadData('Isensee_RS28_TC002', 1); 
arLoadData('Isensee_RS28_TC003', 1); 
arLoadData('Isensee_RS28_TC004', 1); 
arLoadData('Isensee_RS28_TC005', 1); 
arLoadData('Isensee_RS28_TC006', 1); 
arLoadData('Isensee_RS28_TC007', 1); 
arLoadData('Isensee_RS28_TC008', 1); 
arLoadData('Isensee_RS28_TC009', 1); 
arLoadData('Isensee_RS28_TC010', 1); 
arLoadData('Isensee_RS28_TC011', 1); 
arLoadData('Isensee_RS28_TC012', 1); 
arLoadData('Isensee_RS28_TC013', 1); 
arLoadData('Isensee_RS28_TC014', 1); 
arLoadData('Isensee_RS28_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS28_DR001', 1); 
arLoadData('Isensee_RS28_DR002', 1); 
arLoadData('Isensee_RS28_DR003', 1); 
arLoadData('Isensee_RS28_DR004', 1); 
arLoadData('Isensee_RS28_DR005', 1); 
arLoadData('Isensee_RS28_DR006', 1); 
arLoadData('Isensee_RS28_DR007', 1); 
arLoadData('Isensee_RS28_DR008', 1); 
arLoadData('Isensee_RS28_DR009', 1); 
arLoadData('Isensee_RS28_DR010', 1); 
arLoadData('Isensee_RS28_DR011', 1); 
arLoadData('Isensee_RS28_DR012', 1); 
arLoadData('Isensee_RS28_DR013', 1); 
arLoadData('Isensee_RS28_DR014', 1); 
arLoadData('Isensee_RS28_DR015', 1); 
arLoadData('Isensee_RS28_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS28__Final', false, true); 


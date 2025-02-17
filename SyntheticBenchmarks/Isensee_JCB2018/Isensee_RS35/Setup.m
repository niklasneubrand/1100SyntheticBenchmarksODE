% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS35 
% Random seed:		0002035000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS35'); 

% Load the time-course data 
arLoadData('Isensee_RS35_TC001', 1); 
arLoadData('Isensee_RS35_TC002', 1); 
arLoadData('Isensee_RS35_TC003', 1); 
arLoadData('Isensee_RS35_TC004', 1); 
arLoadData('Isensee_RS35_TC005', 1); 
arLoadData('Isensee_RS35_TC006', 1); 
arLoadData('Isensee_RS35_TC007', 1); 
arLoadData('Isensee_RS35_TC008', 1); 
arLoadData('Isensee_RS35_TC009', 1); 
arLoadData('Isensee_RS35_TC010', 1); 
arLoadData('Isensee_RS35_TC011', 1); 
arLoadData('Isensee_RS35_TC012', 1); 
arLoadData('Isensee_RS35_TC013', 1); 
arLoadData('Isensee_RS35_TC014', 1); 
arLoadData('Isensee_RS35_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS35_DR001', 1); 
arLoadData('Isensee_RS35_DR002', 1); 
arLoadData('Isensee_RS35_DR003', 1); 
arLoadData('Isensee_RS35_DR004', 1); 
arLoadData('Isensee_RS35_DR005', 1); 
arLoadData('Isensee_RS35_DR006', 1); 
arLoadData('Isensee_RS35_DR007', 1); 
arLoadData('Isensee_RS35_DR008', 1); 
arLoadData('Isensee_RS35_DR009', 1); 
arLoadData('Isensee_RS35_DR010', 1); 
arLoadData('Isensee_RS35_DR011', 1); 
arLoadData('Isensee_RS35_DR012', 1); 
arLoadData('Isensee_RS35_DR013', 1); 
arLoadData('Isensee_RS35_DR014', 1); 
arLoadData('Isensee_RS35_DR015', 1); 
arLoadData('Isensee_RS35_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS35__Final', false, true); 


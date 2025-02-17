% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS17 
% Random seed:		0002017020 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS17'); 

% Load the time-course data 
arLoadData('Isensee_RS17_TC001', 1); 
arLoadData('Isensee_RS17_TC002', 1); 
arLoadData('Isensee_RS17_TC003', 1); 
arLoadData('Isensee_RS17_TC004', 1); 
arLoadData('Isensee_RS17_TC005', 1); 
arLoadData('Isensee_RS17_TC006', 1); 
arLoadData('Isensee_RS17_TC007', 1); 
arLoadData('Isensee_RS17_TC008', 1); 
arLoadData('Isensee_RS17_TC009', 1); 
arLoadData('Isensee_RS17_TC010', 1); 
arLoadData('Isensee_RS17_TC011', 1); 
arLoadData('Isensee_RS17_TC012', 1); 
arLoadData('Isensee_RS17_TC013', 1); 
arLoadData('Isensee_RS17_TC014', 1); 
arLoadData('Isensee_RS17_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS17_DR001', 1); 
arLoadData('Isensee_RS17_DR002', 1); 
arLoadData('Isensee_RS17_DR003', 1); 
arLoadData('Isensee_RS17_DR004', 1); 
arLoadData('Isensee_RS17_DR005', 1); 
arLoadData('Isensee_RS17_DR006', 1); 
arLoadData('Isensee_RS17_DR007', 1); 
arLoadData('Isensee_RS17_DR008', 1); 
arLoadData('Isensee_RS17_DR009', 1); 
arLoadData('Isensee_RS17_DR010', 1); 
arLoadData('Isensee_RS17_DR011', 1); 
arLoadData('Isensee_RS17_DR012', 1); 
arLoadData('Isensee_RS17_DR013', 1); 
arLoadData('Isensee_RS17_DR014', 1); 
arLoadData('Isensee_RS17_DR015', 1); 
arLoadData('Isensee_RS17_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS17__Final', false, true); 


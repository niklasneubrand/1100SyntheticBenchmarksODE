% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS21 
% Random seed:		0002021000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS21'); 

% Load the time-course data 
arLoadData('Isensee_RS21_TC001', 1); 
arLoadData('Isensee_RS21_TC002', 1); 
arLoadData('Isensee_RS21_TC003', 1); 
arLoadData('Isensee_RS21_TC004', 1); 
arLoadData('Isensee_RS21_TC005', 1); 
arLoadData('Isensee_RS21_TC006', 1); 
arLoadData('Isensee_RS21_TC007', 1); 
arLoadData('Isensee_RS21_TC008', 1); 
arLoadData('Isensee_RS21_TC009', 1); 
arLoadData('Isensee_RS21_TC010', 1); 
arLoadData('Isensee_RS21_TC011', 1); 
arLoadData('Isensee_RS21_TC012', 1); 
arLoadData('Isensee_RS21_TC013', 1); 
arLoadData('Isensee_RS21_TC014', 1); 
arLoadData('Isensee_RS21_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS21_DR001', 1); 
arLoadData('Isensee_RS21_DR002', 1); 
arLoadData('Isensee_RS21_DR003', 1); 
arLoadData('Isensee_RS21_DR004', 1); 
arLoadData('Isensee_RS21_DR005', 1); 
arLoadData('Isensee_RS21_DR006', 1); 
arLoadData('Isensee_RS21_DR007', 1); 
arLoadData('Isensee_RS21_DR008', 1); 
arLoadData('Isensee_RS21_DR009', 1); 
arLoadData('Isensee_RS21_DR010', 1); 
arLoadData('Isensee_RS21_DR011', 1); 
arLoadData('Isensee_RS21_DR012', 1); 
arLoadData('Isensee_RS21_DR013', 1); 
arLoadData('Isensee_RS21_DR014', 1); 
arLoadData('Isensee_RS21_DR015', 1); 
arLoadData('Isensee_RS21_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS21__Final', false, true); 


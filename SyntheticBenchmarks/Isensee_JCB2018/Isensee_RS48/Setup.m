% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS48 
% Random seed:		0002048010 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS48'); 

% Load the time-course data 
arLoadData('Isensee_RS48_TC001', 1); 
arLoadData('Isensee_RS48_TC002', 1); 
arLoadData('Isensee_RS48_TC003', 1); 
arLoadData('Isensee_RS48_TC004', 1); 
arLoadData('Isensee_RS48_TC005', 1); 
arLoadData('Isensee_RS48_TC006', 1); 
arLoadData('Isensee_RS48_TC007', 1); 
arLoadData('Isensee_RS48_TC008', 1); 
arLoadData('Isensee_RS48_TC009', 1); 
arLoadData('Isensee_RS48_TC010', 1); 
arLoadData('Isensee_RS48_TC011', 1); 
arLoadData('Isensee_RS48_TC012', 1); 
arLoadData('Isensee_RS48_TC013', 1); 
arLoadData('Isensee_RS48_TC014', 1); 
arLoadData('Isensee_RS48_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS48_DR001', 1); 
arLoadData('Isensee_RS48_DR002', 1); 
arLoadData('Isensee_RS48_DR003', 1); 
arLoadData('Isensee_RS48_DR004', 1); 
arLoadData('Isensee_RS48_DR005', 1); 
arLoadData('Isensee_RS48_DR006', 1); 
arLoadData('Isensee_RS48_DR007', 1); 
arLoadData('Isensee_RS48_DR008', 1); 
arLoadData('Isensee_RS48_DR009', 1); 
arLoadData('Isensee_RS48_DR010', 1); 
arLoadData('Isensee_RS48_DR011', 1); 
arLoadData('Isensee_RS48_DR012', 1); 
arLoadData('Isensee_RS48_DR013', 1); 
arLoadData('Isensee_RS48_DR014', 1); 
arLoadData('Isensee_RS48_DR015', 1); 
arLoadData('Isensee_RS48_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS48__Final', false, true); 


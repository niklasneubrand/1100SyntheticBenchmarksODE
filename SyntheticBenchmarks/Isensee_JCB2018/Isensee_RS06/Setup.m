% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS06 
% Random seed:		0002006000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS06'); 

% Load the time-course data 
arLoadData('Isensee_RS06_TC001', 1); 
arLoadData('Isensee_RS06_TC002', 1); 
arLoadData('Isensee_RS06_TC003', 1); 
arLoadData('Isensee_RS06_TC004', 1); 
arLoadData('Isensee_RS06_TC005', 1); 
arLoadData('Isensee_RS06_TC006', 1); 
arLoadData('Isensee_RS06_TC007', 1); 
arLoadData('Isensee_RS06_TC008', 1); 
arLoadData('Isensee_RS06_TC009', 1); 
arLoadData('Isensee_RS06_TC010', 1); 
arLoadData('Isensee_RS06_TC011', 1); 
arLoadData('Isensee_RS06_TC012', 1); 
arLoadData('Isensee_RS06_TC013', 1); 
arLoadData('Isensee_RS06_TC014', 1); 
arLoadData('Isensee_RS06_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS06_DR001', 1); 
arLoadData('Isensee_RS06_DR002', 1); 
arLoadData('Isensee_RS06_DR003', 1); 
arLoadData('Isensee_RS06_DR004', 1); 
arLoadData('Isensee_RS06_DR005', 1); 
arLoadData('Isensee_RS06_DR006', 1); 
arLoadData('Isensee_RS06_DR007', 1); 
arLoadData('Isensee_RS06_DR008', 1); 
arLoadData('Isensee_RS06_DR009', 1); 
arLoadData('Isensee_RS06_DR010', 1); 
arLoadData('Isensee_RS06_DR011', 1); 
arLoadData('Isensee_RS06_DR012', 1); 
arLoadData('Isensee_RS06_DR013', 1); 
arLoadData('Isensee_RS06_DR014', 1); 
arLoadData('Isensee_RS06_DR015', 1); 
arLoadData('Isensee_RS06_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS06__Final', false, true); 


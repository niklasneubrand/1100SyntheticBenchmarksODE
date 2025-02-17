% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS37 
% Random seed:		0002037020 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS37'); 

% Load the time-course data 
arLoadData('Isensee_RS37_TC001', 1); 
arLoadData('Isensee_RS37_TC002', 1); 
arLoadData('Isensee_RS37_TC003', 1); 
arLoadData('Isensee_RS37_TC004', 1); 
arLoadData('Isensee_RS37_TC005', 1); 
arLoadData('Isensee_RS37_TC006', 1); 
arLoadData('Isensee_RS37_TC007', 1); 
arLoadData('Isensee_RS37_TC008', 1); 
arLoadData('Isensee_RS37_TC009', 1); 
arLoadData('Isensee_RS37_TC010', 1); 
arLoadData('Isensee_RS37_TC011', 1); 
arLoadData('Isensee_RS37_TC012', 1); 
arLoadData('Isensee_RS37_TC013', 1); 
arLoadData('Isensee_RS37_TC014', 1); 
arLoadData('Isensee_RS37_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS37_DR001', 1); 
arLoadData('Isensee_RS37_DR002', 1); 
arLoadData('Isensee_RS37_DR003', 1); 
arLoadData('Isensee_RS37_DR004', 1); 
arLoadData('Isensee_RS37_DR005', 1); 
arLoadData('Isensee_RS37_DR006', 1); 
arLoadData('Isensee_RS37_DR007', 1); 
arLoadData('Isensee_RS37_DR008', 1); 
arLoadData('Isensee_RS37_DR009', 1); 
arLoadData('Isensee_RS37_DR010', 1); 
arLoadData('Isensee_RS37_DR011', 1); 
arLoadData('Isensee_RS37_DR012', 1); 
arLoadData('Isensee_RS37_DR013', 1); 
arLoadData('Isensee_RS37_DR014', 1); 
arLoadData('Isensee_RS37_DR015', 1); 
arLoadData('Isensee_RS37_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS37__Final', false, true); 


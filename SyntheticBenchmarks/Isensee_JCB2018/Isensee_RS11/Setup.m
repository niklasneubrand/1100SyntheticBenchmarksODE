% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS11 
% Random seed:		0002011000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS11'); 

% Load the time-course data 
arLoadData('Isensee_RS11_TC001', 1); 
arLoadData('Isensee_RS11_TC002', 1); 
arLoadData('Isensee_RS11_TC003', 1); 
arLoadData('Isensee_RS11_TC004', 1); 
arLoadData('Isensee_RS11_TC005', 1); 
arLoadData('Isensee_RS11_TC006', 1); 
arLoadData('Isensee_RS11_TC007', 1); 
arLoadData('Isensee_RS11_TC008', 1); 
arLoadData('Isensee_RS11_TC009', 1); 
arLoadData('Isensee_RS11_TC010', 1); 
arLoadData('Isensee_RS11_TC011', 1); 
arLoadData('Isensee_RS11_TC012', 1); 
arLoadData('Isensee_RS11_TC013', 1); 
arLoadData('Isensee_RS11_TC014', 1); 
arLoadData('Isensee_RS11_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS11_DR001', 1); 
arLoadData('Isensee_RS11_DR002', 1); 
arLoadData('Isensee_RS11_DR003', 1); 
arLoadData('Isensee_RS11_DR004', 1); 
arLoadData('Isensee_RS11_DR005', 1); 
arLoadData('Isensee_RS11_DR006', 1); 
arLoadData('Isensee_RS11_DR007', 1); 
arLoadData('Isensee_RS11_DR008', 1); 
arLoadData('Isensee_RS11_DR009', 1); 
arLoadData('Isensee_RS11_DR010', 1); 
arLoadData('Isensee_RS11_DR011', 1); 
arLoadData('Isensee_RS11_DR012', 1); 
arLoadData('Isensee_RS11_DR013', 1); 
arLoadData('Isensee_RS11_DR014', 1); 
arLoadData('Isensee_RS11_DR015', 1); 
arLoadData('Isensee_RS11_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS11__Final', false, true); 


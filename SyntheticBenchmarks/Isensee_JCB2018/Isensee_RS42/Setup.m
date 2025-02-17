% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS42 
% Random seed:		0002042000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS42'); 

% Load the time-course data 
arLoadData('Isensee_RS42_TC001', 1); 
arLoadData('Isensee_RS42_TC002', 1); 
arLoadData('Isensee_RS42_TC003', 1); 
arLoadData('Isensee_RS42_TC004', 1); 
arLoadData('Isensee_RS42_TC005', 1); 
arLoadData('Isensee_RS42_TC006', 1); 
arLoadData('Isensee_RS42_TC007', 1); 
arLoadData('Isensee_RS42_TC008', 1); 
arLoadData('Isensee_RS42_TC009', 1); 
arLoadData('Isensee_RS42_TC010', 1); 
arLoadData('Isensee_RS42_TC011', 1); 
arLoadData('Isensee_RS42_TC012', 1); 
arLoadData('Isensee_RS42_TC013', 1); 
arLoadData('Isensee_RS42_TC014', 1); 
arLoadData('Isensee_RS42_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS42_DR001', 1); 
arLoadData('Isensee_RS42_DR002', 1); 
arLoadData('Isensee_RS42_DR003', 1); 
arLoadData('Isensee_RS42_DR004', 1); 
arLoadData('Isensee_RS42_DR005', 1); 
arLoadData('Isensee_RS42_DR006', 1); 
arLoadData('Isensee_RS42_DR007', 1); 
arLoadData('Isensee_RS42_DR008', 1); 
arLoadData('Isensee_RS42_DR009', 1); 
arLoadData('Isensee_RS42_DR010', 1); 
arLoadData('Isensee_RS42_DR011', 1); 
arLoadData('Isensee_RS42_DR012', 1); 
arLoadData('Isensee_RS42_DR013', 1); 
arLoadData('Isensee_RS42_DR014', 1); 
arLoadData('Isensee_RS42_DR015', 1); 
arLoadData('Isensee_RS42_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS42__Final', false, true); 


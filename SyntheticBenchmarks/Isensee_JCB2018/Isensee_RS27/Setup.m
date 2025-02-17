% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS27 
% Random seed:		0002027000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS27'); 

% Load the time-course data 
arLoadData('Isensee_RS27_TC001', 1); 
arLoadData('Isensee_RS27_TC002', 1); 
arLoadData('Isensee_RS27_TC003', 1); 
arLoadData('Isensee_RS27_TC004', 1); 
arLoadData('Isensee_RS27_TC005', 1); 
arLoadData('Isensee_RS27_TC006', 1); 
arLoadData('Isensee_RS27_TC007', 1); 
arLoadData('Isensee_RS27_TC008', 1); 
arLoadData('Isensee_RS27_TC009', 1); 
arLoadData('Isensee_RS27_TC010', 1); 
arLoadData('Isensee_RS27_TC011', 1); 
arLoadData('Isensee_RS27_TC012', 1); 
arLoadData('Isensee_RS27_TC013', 1); 
arLoadData('Isensee_RS27_TC014', 1); 
arLoadData('Isensee_RS27_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS27_DR001', 1); 
arLoadData('Isensee_RS27_DR002', 1); 
arLoadData('Isensee_RS27_DR003', 1); 
arLoadData('Isensee_RS27_DR004', 1); 
arLoadData('Isensee_RS27_DR005', 1); 
arLoadData('Isensee_RS27_DR006', 1); 
arLoadData('Isensee_RS27_DR007', 1); 
arLoadData('Isensee_RS27_DR008', 1); 
arLoadData('Isensee_RS27_DR009', 1); 
arLoadData('Isensee_RS27_DR010', 1); 
arLoadData('Isensee_RS27_DR011', 1); 
arLoadData('Isensee_RS27_DR012', 1); 
arLoadData('Isensee_RS27_DR013', 1); 
arLoadData('Isensee_RS27_DR014', 1); 
arLoadData('Isensee_RS27_DR015', 1); 
arLoadData('Isensee_RS27_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS27__Final', false, true); 


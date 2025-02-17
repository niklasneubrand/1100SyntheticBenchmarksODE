% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS25 
% Random seed:		0002025000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS25'); 

% Load the time-course data 
arLoadData('Isensee_RS25_TC001', 1); 
arLoadData('Isensee_RS25_TC002', 1); 
arLoadData('Isensee_RS25_TC003', 1); 
arLoadData('Isensee_RS25_TC004', 1); 
arLoadData('Isensee_RS25_TC005', 1); 
arLoadData('Isensee_RS25_TC006', 1); 
arLoadData('Isensee_RS25_TC007', 1); 
arLoadData('Isensee_RS25_TC008', 1); 
arLoadData('Isensee_RS25_TC009', 1); 
arLoadData('Isensee_RS25_TC010', 1); 
arLoadData('Isensee_RS25_TC011', 1); 
arLoadData('Isensee_RS25_TC012', 1); 
arLoadData('Isensee_RS25_TC013', 1); 
arLoadData('Isensee_RS25_TC014', 1); 
arLoadData('Isensee_RS25_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS25_DR001', 1); 
arLoadData('Isensee_RS25_DR002', 1); 
arLoadData('Isensee_RS25_DR003', 1); 
arLoadData('Isensee_RS25_DR004', 1); 
arLoadData('Isensee_RS25_DR005', 1); 
arLoadData('Isensee_RS25_DR006', 1); 
arLoadData('Isensee_RS25_DR007', 1); 
arLoadData('Isensee_RS25_DR008', 1); 
arLoadData('Isensee_RS25_DR009', 1); 
arLoadData('Isensee_RS25_DR010', 1); 
arLoadData('Isensee_RS25_DR011', 1); 
arLoadData('Isensee_RS25_DR012', 1); 
arLoadData('Isensee_RS25_DR013', 1); 
arLoadData('Isensee_RS25_DR014', 1); 
arLoadData('Isensee_RS25_DR015', 1); 
arLoadData('Isensee_RS25_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS25__Final', false, true); 


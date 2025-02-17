% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS39 
% Random seed:		0002039000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS39'); 

% Load the time-course data 
arLoadData('Isensee_RS39_TC001', 1); 
arLoadData('Isensee_RS39_TC002', 1); 
arLoadData('Isensee_RS39_TC003', 1); 
arLoadData('Isensee_RS39_TC004', 1); 
arLoadData('Isensee_RS39_TC005', 1); 
arLoadData('Isensee_RS39_TC006', 1); 
arLoadData('Isensee_RS39_TC007', 1); 
arLoadData('Isensee_RS39_TC008', 1); 
arLoadData('Isensee_RS39_TC009', 1); 
arLoadData('Isensee_RS39_TC010', 1); 
arLoadData('Isensee_RS39_TC011', 1); 
arLoadData('Isensee_RS39_TC012', 1); 
arLoadData('Isensee_RS39_TC013', 1); 
arLoadData('Isensee_RS39_TC014', 1); 
arLoadData('Isensee_RS39_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS39_DR001', 1); 
arLoadData('Isensee_RS39_DR002', 1); 
arLoadData('Isensee_RS39_DR003', 1); 
arLoadData('Isensee_RS39_DR004', 1); 
arLoadData('Isensee_RS39_DR005', 1); 
arLoadData('Isensee_RS39_DR006', 1); 
arLoadData('Isensee_RS39_DR007', 1); 
arLoadData('Isensee_RS39_DR008', 1); 
arLoadData('Isensee_RS39_DR009', 1); 
arLoadData('Isensee_RS39_DR010', 1); 
arLoadData('Isensee_RS39_DR011', 1); 
arLoadData('Isensee_RS39_DR012', 1); 
arLoadData('Isensee_RS39_DR013', 1); 
arLoadData('Isensee_RS39_DR014', 1); 
arLoadData('Isensee_RS39_DR015', 1); 
arLoadData('Isensee_RS39_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS39__Final', false, true); 


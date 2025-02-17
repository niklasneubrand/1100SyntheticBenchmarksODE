% Setup File For Realistic Simulation
% Original project:	Isensee_JCB2018 
% RS project name:	Isensee_RS44 
% Random seed:		0002044000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Isensee_RS44'); 

% Load the time-course data 
arLoadData('Isensee_RS44_TC001', 1); 
arLoadData('Isensee_RS44_TC002', 1); 
arLoadData('Isensee_RS44_TC003', 1); 
arLoadData('Isensee_RS44_TC004', 1); 
arLoadData('Isensee_RS44_TC005', 1); 
arLoadData('Isensee_RS44_TC006', 1); 
arLoadData('Isensee_RS44_TC007', 1); 
arLoadData('Isensee_RS44_TC008', 1); 
arLoadData('Isensee_RS44_TC009', 1); 
arLoadData('Isensee_RS44_TC010', 1); 
arLoadData('Isensee_RS44_TC011', 1); 
arLoadData('Isensee_RS44_TC012', 1); 
arLoadData('Isensee_RS44_TC013', 1); 
arLoadData('Isensee_RS44_TC014', 1); 
arLoadData('Isensee_RS44_TC015', 1); 

% Load the dose-response data 
arLoadData('Isensee_RS44_DR001', 1); 
arLoadData('Isensee_RS44_DR002', 1); 
arLoadData('Isensee_RS44_DR003', 1); 
arLoadData('Isensee_RS44_DR004', 1); 
arLoadData('Isensee_RS44_DR005', 1); 
arLoadData('Isensee_RS44_DR006', 1); 
arLoadData('Isensee_RS44_DR007', 1); 
arLoadData('Isensee_RS44_DR008', 1); 
arLoadData('Isensee_RS44_DR009', 1); 
arLoadData('Isensee_RS44_DR010', 1); 
arLoadData('Isensee_RS44_DR011', 1); 
arLoadData('Isensee_RS44_DR012', 1); 
arLoadData('Isensee_RS44_DR013', 1); 
arLoadData('Isensee_RS44_DR014', 1); 
arLoadData('Isensee_RS44_DR015', 1); 
arLoadData('Isensee_RS44_DR016', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC001'), 'all', {}, 1); 

% Save the project 
arSave('Isensee_RS44__Final', false, true); 


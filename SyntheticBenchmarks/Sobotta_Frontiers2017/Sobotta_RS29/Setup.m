% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS29 
% Random seed:		0001529000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS29'); 

% Load the time-course data 
arLoadData('Sobotta_RS29_TC001', 1); 
arLoadData('Sobotta_RS29_TC002', 1); 
arLoadData('Sobotta_RS29_TC003', 1); 
arLoadData('Sobotta_RS29_TC004', 1); 
arLoadData('Sobotta_RS29_TC005', 1); 
arLoadData('Sobotta_RS29_TC006', 1); 
arLoadData('Sobotta_RS29_TC007', 1); 
arLoadData('Sobotta_RS29_TC008', 1); 
arLoadData('Sobotta_RS29_TC009', 1); 
arLoadData('Sobotta_RS29_TC010', 1); 
arLoadData('Sobotta_RS29_TC011', 1); 
arLoadData('Sobotta_RS29_TC012', 1); 
arLoadData('Sobotta_RS29_TC013', 1); 
arLoadData('Sobotta_RS29_TC014', 1); 
arLoadData('Sobotta_RS29_TC015', 1); 
arLoadData('Sobotta_RS29_TC016', 1); 
arLoadData('Sobotta_RS29_TC017', 1); 
arLoadData('Sobotta_RS29_TC018', 1); 
arLoadData('Sobotta_RS29_TC019', 1); 
arLoadData('Sobotta_RS29_TC020', 1); 
arLoadData('Sobotta_RS29_TC021', 1); 
arLoadData('Sobotta_RS29_TC022', 1); 
arLoadData('Sobotta_RS29_TC023', 1); 
arLoadData('Sobotta_RS29_TC024', 1); 
arLoadData('Sobotta_RS29_TC025', 1); 
arLoadData('Sobotta_RS29_TC026', 1); 
arLoadData('Sobotta_RS29_TC027', 1); 
arLoadData('Sobotta_RS29_TC028', 1); 
arLoadData('Sobotta_RS29_TC029', 1); 
arLoadData('Sobotta_RS29_TC030', 1); 
arLoadData('Sobotta_RS29_TC031', 1); 
arLoadData('Sobotta_RS29_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS29_DR001', 1); 
arLoadData('Sobotta_RS29_DR002', 1); 
arLoadData('Sobotta_RS29_DR003', 1); 
arLoadData('Sobotta_RS29_DR004', 1); 
arLoadData('Sobotta_RS29_DR005', 1); 
arLoadData('Sobotta_RS29_DR006', 1); 
arLoadData('Sobotta_RS29_DR007', 1); 
arLoadData('Sobotta_RS29_DR008', 1); 
arLoadData('Sobotta_RS29_DR009', 1); 
arLoadData('Sobotta_RS29_DR010', 1); 
arLoadData('Sobotta_RS29_DR011', 1); 
arLoadData('Sobotta_RS29_DR012', 1); 
arLoadData('Sobotta_RS29_DR013', 1); 
arLoadData('Sobotta_RS29_DR014', 1); 
arLoadData('Sobotta_RS29_DR015', 1); 
arLoadData('Sobotta_RS29_DR016', 1); 
arLoadData('Sobotta_RS29_DR017', 1); 
arLoadData('Sobotta_RS29_DR018', 1); 
arLoadData('Sobotta_RS29_DR019', 1); 
arLoadData('Sobotta_RS29_DR020', 1); 
arLoadData('Sobotta_RS29_DR021', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 2000; 
ar.config.eq_tol = 1.000000e-10; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC002'), 'all', {}, 1); 

% Save the project 
arSave('Sobotta_RS29__Final', false, true); 


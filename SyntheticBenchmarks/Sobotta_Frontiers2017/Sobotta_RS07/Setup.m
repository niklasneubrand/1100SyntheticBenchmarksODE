% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS07 
% Random seed:		0001507000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS07'); 

% Load the time-course data 
arLoadData('Sobotta_RS07_TC001', 1); 
arLoadData('Sobotta_RS07_TC002', 1); 
arLoadData('Sobotta_RS07_TC003', 1); 
arLoadData('Sobotta_RS07_TC004', 1); 
arLoadData('Sobotta_RS07_TC005', 1); 
arLoadData('Sobotta_RS07_TC006', 1); 
arLoadData('Sobotta_RS07_TC007', 1); 
arLoadData('Sobotta_RS07_TC008', 1); 
arLoadData('Sobotta_RS07_TC009', 1); 
arLoadData('Sobotta_RS07_TC010', 1); 
arLoadData('Sobotta_RS07_TC011', 1); 
arLoadData('Sobotta_RS07_TC012', 1); 
arLoadData('Sobotta_RS07_TC013', 1); 
arLoadData('Sobotta_RS07_TC014', 1); 
arLoadData('Sobotta_RS07_TC015', 1); 
arLoadData('Sobotta_RS07_TC016', 1); 
arLoadData('Sobotta_RS07_TC017', 1); 
arLoadData('Sobotta_RS07_TC018', 1); 
arLoadData('Sobotta_RS07_TC019', 1); 
arLoadData('Sobotta_RS07_TC020', 1); 
arLoadData('Sobotta_RS07_TC021', 1); 
arLoadData('Sobotta_RS07_TC022', 1); 
arLoadData('Sobotta_RS07_TC023', 1); 
arLoadData('Sobotta_RS07_TC024', 1); 
arLoadData('Sobotta_RS07_TC025', 1); 
arLoadData('Sobotta_RS07_TC026', 1); 
arLoadData('Sobotta_RS07_TC027', 1); 
arLoadData('Sobotta_RS07_TC028', 1); 
arLoadData('Sobotta_RS07_TC029', 1); 
arLoadData('Sobotta_RS07_TC030', 1); 
arLoadData('Sobotta_RS07_TC031', 1); 
arLoadData('Sobotta_RS07_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS07_DR001', 1); 
arLoadData('Sobotta_RS07_DR002', 1); 
arLoadData('Sobotta_RS07_DR003', 1); 
arLoadData('Sobotta_RS07_DR004', 1); 
arLoadData('Sobotta_RS07_DR005', 1); 
arLoadData('Sobotta_RS07_DR006', 1); 
arLoadData('Sobotta_RS07_DR007', 1); 
arLoadData('Sobotta_RS07_DR008', 1); 
arLoadData('Sobotta_RS07_DR009', 1); 
arLoadData('Sobotta_RS07_DR010', 1); 
arLoadData('Sobotta_RS07_DR011', 1); 
arLoadData('Sobotta_RS07_DR012', 1); 
arLoadData('Sobotta_RS07_DR013', 1); 
arLoadData('Sobotta_RS07_DR014', 1); 
arLoadData('Sobotta_RS07_DR015', 1); 
arLoadData('Sobotta_RS07_DR016', 1); 
arLoadData('Sobotta_RS07_DR017', 1); 
arLoadData('Sobotta_RS07_DR018', 1); 
arLoadData('Sobotta_RS07_DR019', 1); 
arLoadData('Sobotta_RS07_DR020', 1); 
arLoadData('Sobotta_RS07_DR021', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.eq_tol = 1.000000e-10; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC002'), 'all', {}, 1); 

% Save the project 
arSave('Sobotta_RS07__Final', false, true); 


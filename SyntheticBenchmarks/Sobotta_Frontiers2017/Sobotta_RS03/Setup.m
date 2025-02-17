% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS03 
% Random seed:		0001503000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS03'); 

% Load the time-course data 
arLoadData('Sobotta_RS03_TC001', 1); 
arLoadData('Sobotta_RS03_TC002', 1); 
arLoadData('Sobotta_RS03_TC003', 1); 
arLoadData('Sobotta_RS03_TC004', 1); 
arLoadData('Sobotta_RS03_TC005', 1); 
arLoadData('Sobotta_RS03_TC006', 1); 
arLoadData('Sobotta_RS03_TC007', 1); 
arLoadData('Sobotta_RS03_TC008', 1); 
arLoadData('Sobotta_RS03_TC009', 1); 
arLoadData('Sobotta_RS03_TC010', 1); 
arLoadData('Sobotta_RS03_TC011', 1); 
arLoadData('Sobotta_RS03_TC012', 1); 
arLoadData('Sobotta_RS03_TC013', 1); 
arLoadData('Sobotta_RS03_TC014', 1); 
arLoadData('Sobotta_RS03_TC015', 1); 
arLoadData('Sobotta_RS03_TC016', 1); 
arLoadData('Sobotta_RS03_TC017', 1); 
arLoadData('Sobotta_RS03_TC018', 1); 
arLoadData('Sobotta_RS03_TC019', 1); 
arLoadData('Sobotta_RS03_TC020', 1); 
arLoadData('Sobotta_RS03_TC021', 1); 
arLoadData('Sobotta_RS03_TC022', 1); 
arLoadData('Sobotta_RS03_TC023', 1); 
arLoadData('Sobotta_RS03_TC024', 1); 
arLoadData('Sobotta_RS03_TC025', 1); 
arLoadData('Sobotta_RS03_TC026', 1); 
arLoadData('Sobotta_RS03_TC027', 1); 
arLoadData('Sobotta_RS03_TC028', 1); 
arLoadData('Sobotta_RS03_TC029', 1); 
arLoadData('Sobotta_RS03_TC030', 1); 
arLoadData('Sobotta_RS03_TC031', 1); 
arLoadData('Sobotta_RS03_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS03_DR001', 1); 
arLoadData('Sobotta_RS03_DR002', 1); 
arLoadData('Sobotta_RS03_DR003', 1); 
arLoadData('Sobotta_RS03_DR004', 1); 
arLoadData('Sobotta_RS03_DR005', 1); 
arLoadData('Sobotta_RS03_DR006', 1); 
arLoadData('Sobotta_RS03_DR007', 1); 
arLoadData('Sobotta_RS03_DR008', 1); 
arLoadData('Sobotta_RS03_DR009', 1); 
arLoadData('Sobotta_RS03_DR010', 1); 
arLoadData('Sobotta_RS03_DR011', 1); 
arLoadData('Sobotta_RS03_DR012', 1); 
arLoadData('Sobotta_RS03_DR013', 1); 
arLoadData('Sobotta_RS03_DR014', 1); 
arLoadData('Sobotta_RS03_DR015', 1); 
arLoadData('Sobotta_RS03_DR016', 1); 
arLoadData('Sobotta_RS03_DR017', 1); 
arLoadData('Sobotta_RS03_DR018', 1); 
arLoadData('Sobotta_RS03_DR019', 1); 
arLoadData('Sobotta_RS03_DR020', 1); 
arLoadData('Sobotta_RS03_DR021', 1); 

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
arSave('Sobotta_RS03__Final', false, true); 


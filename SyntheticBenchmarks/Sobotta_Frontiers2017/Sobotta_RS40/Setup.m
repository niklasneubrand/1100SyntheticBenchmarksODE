% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS40 
% Random seed:		0001540000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS40'); 

% Load the time-course data 
arLoadData('Sobotta_RS40_TC001', 1); 
arLoadData('Sobotta_RS40_TC002', 1); 
arLoadData('Sobotta_RS40_TC003', 1); 
arLoadData('Sobotta_RS40_TC004', 1); 
arLoadData('Sobotta_RS40_TC005', 1); 
arLoadData('Sobotta_RS40_TC006', 1); 
arLoadData('Sobotta_RS40_TC007', 1); 
arLoadData('Sobotta_RS40_TC008', 1); 
arLoadData('Sobotta_RS40_TC009', 1); 
arLoadData('Sobotta_RS40_TC010', 1); 
arLoadData('Sobotta_RS40_TC011', 1); 
arLoadData('Sobotta_RS40_TC012', 1); 
arLoadData('Sobotta_RS40_TC013', 1); 
arLoadData('Sobotta_RS40_TC014', 1); 
arLoadData('Sobotta_RS40_TC015', 1); 
arLoadData('Sobotta_RS40_TC016', 1); 
arLoadData('Sobotta_RS40_TC017', 1); 
arLoadData('Sobotta_RS40_TC018', 1); 
arLoadData('Sobotta_RS40_TC019', 1); 
arLoadData('Sobotta_RS40_TC020', 1); 
arLoadData('Sobotta_RS40_TC021', 1); 
arLoadData('Sobotta_RS40_TC022', 1); 
arLoadData('Sobotta_RS40_TC023', 1); 
arLoadData('Sobotta_RS40_TC024', 1); 
arLoadData('Sobotta_RS40_TC025', 1); 
arLoadData('Sobotta_RS40_TC026', 1); 
arLoadData('Sobotta_RS40_TC027', 1); 
arLoadData('Sobotta_RS40_TC028', 1); 
arLoadData('Sobotta_RS40_TC029', 1); 
arLoadData('Sobotta_RS40_TC030', 1); 
arLoadData('Sobotta_RS40_TC031', 1); 
arLoadData('Sobotta_RS40_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS40_DR001', 1); 
arLoadData('Sobotta_RS40_DR002', 1); 
arLoadData('Sobotta_RS40_DR003', 1); 
arLoadData('Sobotta_RS40_DR004', 1); 
arLoadData('Sobotta_RS40_DR005', 1); 
arLoadData('Sobotta_RS40_DR006', 1); 
arLoadData('Sobotta_RS40_DR007', 1); 
arLoadData('Sobotta_RS40_DR008', 1); 
arLoadData('Sobotta_RS40_DR009', 1); 
arLoadData('Sobotta_RS40_DR010', 1); 
arLoadData('Sobotta_RS40_DR011', 1); 
arLoadData('Sobotta_RS40_DR012', 1); 
arLoadData('Sobotta_RS40_DR013', 1); 
arLoadData('Sobotta_RS40_DR014', 1); 
arLoadData('Sobotta_RS40_DR015', 1); 
arLoadData('Sobotta_RS40_DR016', 1); 
arLoadData('Sobotta_RS40_DR017', 1); 
arLoadData('Sobotta_RS40_DR018', 1); 
arLoadData('Sobotta_RS40_DR019', 1); 
arLoadData('Sobotta_RS40_DR020', 1); 
arLoadData('Sobotta_RS40_DR021', 1); 

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
arSave('Sobotta_RS40__Final', false, true); 


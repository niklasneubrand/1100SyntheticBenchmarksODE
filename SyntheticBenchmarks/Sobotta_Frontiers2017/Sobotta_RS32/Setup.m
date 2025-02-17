% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS32 
% Random seed:		0001532000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS32'); 

% Load the time-course data 
arLoadData('Sobotta_RS32_TC001', 1); 
arLoadData('Sobotta_RS32_TC002', 1); 
arLoadData('Sobotta_RS32_TC003', 1); 
arLoadData('Sobotta_RS32_TC004', 1); 
arLoadData('Sobotta_RS32_TC005', 1); 
arLoadData('Sobotta_RS32_TC006', 1); 
arLoadData('Sobotta_RS32_TC007', 1); 
arLoadData('Sobotta_RS32_TC008', 1); 
arLoadData('Sobotta_RS32_TC009', 1); 
arLoadData('Sobotta_RS32_TC010', 1); 
arLoadData('Sobotta_RS32_TC011', 1); 
arLoadData('Sobotta_RS32_TC012', 1); 
arLoadData('Sobotta_RS32_TC013', 1); 
arLoadData('Sobotta_RS32_TC014', 1); 
arLoadData('Sobotta_RS32_TC015', 1); 
arLoadData('Sobotta_RS32_TC016', 1); 
arLoadData('Sobotta_RS32_TC017', 1); 
arLoadData('Sobotta_RS32_TC018', 1); 
arLoadData('Sobotta_RS32_TC019', 1); 
arLoadData('Sobotta_RS32_TC020', 1); 
arLoadData('Sobotta_RS32_TC021', 1); 
arLoadData('Sobotta_RS32_TC022', 1); 
arLoadData('Sobotta_RS32_TC023', 1); 
arLoadData('Sobotta_RS32_TC024', 1); 
arLoadData('Sobotta_RS32_TC025', 1); 
arLoadData('Sobotta_RS32_TC026', 1); 
arLoadData('Sobotta_RS32_TC027', 1); 
arLoadData('Sobotta_RS32_TC028', 1); 
arLoadData('Sobotta_RS32_TC029', 1); 
arLoadData('Sobotta_RS32_TC030', 1); 
arLoadData('Sobotta_RS32_TC031', 1); 
arLoadData('Sobotta_RS32_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS32_DR001', 1); 
arLoadData('Sobotta_RS32_DR002', 1); 
arLoadData('Sobotta_RS32_DR003', 1); 
arLoadData('Sobotta_RS32_DR004', 1); 
arLoadData('Sobotta_RS32_DR005', 1); 
arLoadData('Sobotta_RS32_DR006', 1); 
arLoadData('Sobotta_RS32_DR007', 1); 
arLoadData('Sobotta_RS32_DR008', 1); 
arLoadData('Sobotta_RS32_DR009', 1); 
arLoadData('Sobotta_RS32_DR010', 1); 
arLoadData('Sobotta_RS32_DR011', 1); 
arLoadData('Sobotta_RS32_DR012', 1); 
arLoadData('Sobotta_RS32_DR013', 1); 
arLoadData('Sobotta_RS32_DR014', 1); 
arLoadData('Sobotta_RS32_DR015', 1); 
arLoadData('Sobotta_RS32_DR016', 1); 
arLoadData('Sobotta_RS32_DR017', 1); 
arLoadData('Sobotta_RS32_DR018', 1); 
arLoadData('Sobotta_RS32_DR019', 1); 
arLoadData('Sobotta_RS32_DR020', 1); 
arLoadData('Sobotta_RS32_DR021', 1); 

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
arSave('Sobotta_RS32__Final', false, true); 


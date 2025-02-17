% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS18 
% Random seed:		0001518000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS18'); 

% Load the time-course data 
arLoadData('Sobotta_RS18_TC001', 1); 
arLoadData('Sobotta_RS18_TC002', 1); 
arLoadData('Sobotta_RS18_TC003', 1); 
arLoadData('Sobotta_RS18_TC004', 1); 
arLoadData('Sobotta_RS18_TC005', 1); 
arLoadData('Sobotta_RS18_TC006', 1); 
arLoadData('Sobotta_RS18_TC007', 1); 
arLoadData('Sobotta_RS18_TC008', 1); 
arLoadData('Sobotta_RS18_TC009', 1); 
arLoadData('Sobotta_RS18_TC010', 1); 
arLoadData('Sobotta_RS18_TC011', 1); 
arLoadData('Sobotta_RS18_TC012', 1); 
arLoadData('Sobotta_RS18_TC013', 1); 
arLoadData('Sobotta_RS18_TC014', 1); 
arLoadData('Sobotta_RS18_TC015', 1); 
arLoadData('Sobotta_RS18_TC016', 1); 
arLoadData('Sobotta_RS18_TC017', 1); 
arLoadData('Sobotta_RS18_TC018', 1); 
arLoadData('Sobotta_RS18_TC019', 1); 
arLoadData('Sobotta_RS18_TC020', 1); 
arLoadData('Sobotta_RS18_TC021', 1); 
arLoadData('Sobotta_RS18_TC022', 1); 
arLoadData('Sobotta_RS18_TC023', 1); 
arLoadData('Sobotta_RS18_TC024', 1); 
arLoadData('Sobotta_RS18_TC025', 1); 
arLoadData('Sobotta_RS18_TC026', 1); 
arLoadData('Sobotta_RS18_TC027', 1); 
arLoadData('Sobotta_RS18_TC028', 1); 
arLoadData('Sobotta_RS18_TC029', 1); 
arLoadData('Sobotta_RS18_TC030', 1); 
arLoadData('Sobotta_RS18_TC031', 1); 
arLoadData('Sobotta_RS18_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS18_DR001', 1); 
arLoadData('Sobotta_RS18_DR002', 1); 
arLoadData('Sobotta_RS18_DR003', 1); 
arLoadData('Sobotta_RS18_DR004', 1); 
arLoadData('Sobotta_RS18_DR005', 1); 
arLoadData('Sobotta_RS18_DR006', 1); 
arLoadData('Sobotta_RS18_DR007', 1); 
arLoadData('Sobotta_RS18_DR008', 1); 
arLoadData('Sobotta_RS18_DR009', 1); 
arLoadData('Sobotta_RS18_DR010', 1); 
arLoadData('Sobotta_RS18_DR011', 1); 
arLoadData('Sobotta_RS18_DR012', 1); 
arLoadData('Sobotta_RS18_DR013', 1); 
arLoadData('Sobotta_RS18_DR014', 1); 
arLoadData('Sobotta_RS18_DR015', 1); 
arLoadData('Sobotta_RS18_DR016', 1); 
arLoadData('Sobotta_RS18_DR017', 1); 
arLoadData('Sobotta_RS18_DR018', 1); 
arLoadData('Sobotta_RS18_DR019', 1); 
arLoadData('Sobotta_RS18_DR020', 1); 
arLoadData('Sobotta_RS18_DR021', 1); 

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
arSave('Sobotta_RS18__Final', false, true); 


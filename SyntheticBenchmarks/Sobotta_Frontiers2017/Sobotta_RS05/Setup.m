% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS05 
% Random seed:		0001505000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS05'); 

% Load the time-course data 
arLoadData('Sobotta_RS05_TC001', 1); 
arLoadData('Sobotta_RS05_TC002', 1); 
arLoadData('Sobotta_RS05_TC003', 1); 
arLoadData('Sobotta_RS05_TC004', 1); 
arLoadData('Sobotta_RS05_TC005', 1); 
arLoadData('Sobotta_RS05_TC006', 1); 
arLoadData('Sobotta_RS05_TC007', 1); 
arLoadData('Sobotta_RS05_TC008', 1); 
arLoadData('Sobotta_RS05_TC009', 1); 
arLoadData('Sobotta_RS05_TC010', 1); 
arLoadData('Sobotta_RS05_TC011', 1); 
arLoadData('Sobotta_RS05_TC012', 1); 
arLoadData('Sobotta_RS05_TC013', 1); 
arLoadData('Sobotta_RS05_TC014', 1); 
arLoadData('Sobotta_RS05_TC015', 1); 
arLoadData('Sobotta_RS05_TC016', 1); 
arLoadData('Sobotta_RS05_TC017', 1); 
arLoadData('Sobotta_RS05_TC018', 1); 
arLoadData('Sobotta_RS05_TC019', 1); 
arLoadData('Sobotta_RS05_TC020', 1); 
arLoadData('Sobotta_RS05_TC021', 1); 
arLoadData('Sobotta_RS05_TC022', 1); 
arLoadData('Sobotta_RS05_TC023', 1); 
arLoadData('Sobotta_RS05_TC024', 1); 
arLoadData('Sobotta_RS05_TC025', 1); 
arLoadData('Sobotta_RS05_TC026', 1); 
arLoadData('Sobotta_RS05_TC027', 1); 
arLoadData('Sobotta_RS05_TC028', 1); 
arLoadData('Sobotta_RS05_TC029', 1); 
arLoadData('Sobotta_RS05_TC030', 1); 
arLoadData('Sobotta_RS05_TC031', 1); 
arLoadData('Sobotta_RS05_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS05_DR001', 1); 
arLoadData('Sobotta_RS05_DR002', 1); 
arLoadData('Sobotta_RS05_DR003', 1); 
arLoadData('Sobotta_RS05_DR004', 1); 
arLoadData('Sobotta_RS05_DR005', 1); 
arLoadData('Sobotta_RS05_DR006', 1); 
arLoadData('Sobotta_RS05_DR007', 1); 
arLoadData('Sobotta_RS05_DR008', 1); 
arLoadData('Sobotta_RS05_DR009', 1); 
arLoadData('Sobotta_RS05_DR010', 1); 
arLoadData('Sobotta_RS05_DR011', 1); 
arLoadData('Sobotta_RS05_DR012', 1); 
arLoadData('Sobotta_RS05_DR013', 1); 
arLoadData('Sobotta_RS05_DR014', 1); 
arLoadData('Sobotta_RS05_DR015', 1); 
arLoadData('Sobotta_RS05_DR016', 1); 
arLoadData('Sobotta_RS05_DR017', 1); 
arLoadData('Sobotta_RS05_DR018', 1); 
arLoadData('Sobotta_RS05_DR019', 1); 
arLoadData('Sobotta_RS05_DR020', 1); 
arLoadData('Sobotta_RS05_DR021', 1); 

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
arSave('Sobotta_RS05__Final', false, true); 


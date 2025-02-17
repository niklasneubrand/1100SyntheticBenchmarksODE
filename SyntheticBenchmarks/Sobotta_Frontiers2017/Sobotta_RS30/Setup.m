% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS30 
% Random seed:		0001530000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS30'); 

% Load the time-course data 
arLoadData('Sobotta_RS30_TC001', 1); 
arLoadData('Sobotta_RS30_TC002', 1); 
arLoadData('Sobotta_RS30_TC003', 1); 
arLoadData('Sobotta_RS30_TC004', 1); 
arLoadData('Sobotta_RS30_TC005', 1); 
arLoadData('Sobotta_RS30_TC006', 1); 
arLoadData('Sobotta_RS30_TC007', 1); 
arLoadData('Sobotta_RS30_TC008', 1); 
arLoadData('Sobotta_RS30_TC009', 1); 
arLoadData('Sobotta_RS30_TC010', 1); 
arLoadData('Sobotta_RS30_TC011', 1); 
arLoadData('Sobotta_RS30_TC012', 1); 
arLoadData('Sobotta_RS30_TC013', 1); 
arLoadData('Sobotta_RS30_TC014', 1); 
arLoadData('Sobotta_RS30_TC015', 1); 
arLoadData('Sobotta_RS30_TC016', 1); 
arLoadData('Sobotta_RS30_TC017', 1); 
arLoadData('Sobotta_RS30_TC018', 1); 
arLoadData('Sobotta_RS30_TC019', 1); 
arLoadData('Sobotta_RS30_TC020', 1); 
arLoadData('Sobotta_RS30_TC021', 1); 
arLoadData('Sobotta_RS30_TC022', 1); 
arLoadData('Sobotta_RS30_TC023', 1); 
arLoadData('Sobotta_RS30_TC024', 1); 
arLoadData('Sobotta_RS30_TC025', 1); 
arLoadData('Sobotta_RS30_TC026', 1); 
arLoadData('Sobotta_RS30_TC027', 1); 
arLoadData('Sobotta_RS30_TC028', 1); 
arLoadData('Sobotta_RS30_TC029', 1); 
arLoadData('Sobotta_RS30_TC030', 1); 
arLoadData('Sobotta_RS30_TC031', 1); 
arLoadData('Sobotta_RS30_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS30_DR001', 1); 
arLoadData('Sobotta_RS30_DR002', 1); 
arLoadData('Sobotta_RS30_DR003', 1); 
arLoadData('Sobotta_RS30_DR004', 1); 
arLoadData('Sobotta_RS30_DR005', 1); 
arLoadData('Sobotta_RS30_DR006', 1); 
arLoadData('Sobotta_RS30_DR007', 1); 
arLoadData('Sobotta_RS30_DR008', 1); 
arLoadData('Sobotta_RS30_DR009', 1); 
arLoadData('Sobotta_RS30_DR010', 1); 
arLoadData('Sobotta_RS30_DR011', 1); 
arLoadData('Sobotta_RS30_DR012', 1); 
arLoadData('Sobotta_RS30_DR013', 1); 
arLoadData('Sobotta_RS30_DR014', 1); 
arLoadData('Sobotta_RS30_DR015', 1); 
arLoadData('Sobotta_RS30_DR016', 1); 
arLoadData('Sobotta_RS30_DR017', 1); 
arLoadData('Sobotta_RS30_DR018', 1); 
arLoadData('Sobotta_RS30_DR019', 1); 
arLoadData('Sobotta_RS30_DR020', 1); 
arLoadData('Sobotta_RS30_DR021', 1); 

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
arSave('Sobotta_RS30__Final', false, true); 


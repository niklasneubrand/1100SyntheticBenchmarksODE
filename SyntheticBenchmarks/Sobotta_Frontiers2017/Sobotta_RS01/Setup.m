% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS01 
% Random seed:		0001501000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS01'); 

% Load the time-course data 
arLoadData('Sobotta_RS01_TC001', 1); 
arLoadData('Sobotta_RS01_TC002', 1); 
arLoadData('Sobotta_RS01_TC003', 1); 
arLoadData('Sobotta_RS01_TC004', 1); 
arLoadData('Sobotta_RS01_TC005', 1); 
arLoadData('Sobotta_RS01_TC006', 1); 
arLoadData('Sobotta_RS01_TC007', 1); 
arLoadData('Sobotta_RS01_TC008', 1); 
arLoadData('Sobotta_RS01_TC009', 1); 
arLoadData('Sobotta_RS01_TC010', 1); 
arLoadData('Sobotta_RS01_TC011', 1); 
arLoadData('Sobotta_RS01_TC012', 1); 
arLoadData('Sobotta_RS01_TC013', 1); 
arLoadData('Sobotta_RS01_TC014', 1); 
arLoadData('Sobotta_RS01_TC015', 1); 
arLoadData('Sobotta_RS01_TC016', 1); 
arLoadData('Sobotta_RS01_TC017', 1); 
arLoadData('Sobotta_RS01_TC018', 1); 
arLoadData('Sobotta_RS01_TC019', 1); 
arLoadData('Sobotta_RS01_TC020', 1); 
arLoadData('Sobotta_RS01_TC021', 1); 
arLoadData('Sobotta_RS01_TC022', 1); 
arLoadData('Sobotta_RS01_TC023', 1); 
arLoadData('Sobotta_RS01_TC024', 1); 
arLoadData('Sobotta_RS01_TC025', 1); 
arLoadData('Sobotta_RS01_TC026', 1); 
arLoadData('Sobotta_RS01_TC027', 1); 
arLoadData('Sobotta_RS01_TC028', 1); 
arLoadData('Sobotta_RS01_TC029', 1); 
arLoadData('Sobotta_RS01_TC030', 1); 
arLoadData('Sobotta_RS01_TC031', 1); 
arLoadData('Sobotta_RS01_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS01_DR001', 1); 
arLoadData('Sobotta_RS01_DR002', 1); 
arLoadData('Sobotta_RS01_DR003', 1); 
arLoadData('Sobotta_RS01_DR004', 1); 
arLoadData('Sobotta_RS01_DR005', 1); 
arLoadData('Sobotta_RS01_DR006', 1); 
arLoadData('Sobotta_RS01_DR007', 1); 
arLoadData('Sobotta_RS01_DR008', 1); 
arLoadData('Sobotta_RS01_DR009', 1); 
arLoadData('Sobotta_RS01_DR010', 1); 
arLoadData('Sobotta_RS01_DR011', 1); 
arLoadData('Sobotta_RS01_DR012', 1); 
arLoadData('Sobotta_RS01_DR013', 1); 
arLoadData('Sobotta_RS01_DR014', 1); 
arLoadData('Sobotta_RS01_DR015', 1); 
arLoadData('Sobotta_RS01_DR016', 1); 
arLoadData('Sobotta_RS01_DR017', 1); 
arLoadData('Sobotta_RS01_DR018', 1); 
arLoadData('Sobotta_RS01_DR019', 1); 
arLoadData('Sobotta_RS01_DR020', 1); 
arLoadData('Sobotta_RS01_DR021', 1); 

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
arSave('Sobotta_RS01__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS43 
% Random seed:		0001543020 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS43'); 

% Load the time-course data 
arLoadData('Sobotta_RS43_TC001', 1); 
arLoadData('Sobotta_RS43_TC002', 1); 
arLoadData('Sobotta_RS43_TC003', 1); 
arLoadData('Sobotta_RS43_TC004', 1); 
arLoadData('Sobotta_RS43_TC005', 1); 
arLoadData('Sobotta_RS43_TC006', 1); 
arLoadData('Sobotta_RS43_TC007', 1); 
arLoadData('Sobotta_RS43_TC008', 1); 
arLoadData('Sobotta_RS43_TC009', 1); 
arLoadData('Sobotta_RS43_TC010', 1); 
arLoadData('Sobotta_RS43_TC011', 1); 
arLoadData('Sobotta_RS43_TC012', 1); 
arLoadData('Sobotta_RS43_TC013', 1); 
arLoadData('Sobotta_RS43_TC014', 1); 
arLoadData('Sobotta_RS43_TC015', 1); 
arLoadData('Sobotta_RS43_TC016', 1); 
arLoadData('Sobotta_RS43_TC017', 1); 
arLoadData('Sobotta_RS43_TC018', 1); 
arLoadData('Sobotta_RS43_TC019', 1); 
arLoadData('Sobotta_RS43_TC020', 1); 
arLoadData('Sobotta_RS43_TC021', 1); 
arLoadData('Sobotta_RS43_TC022', 1); 
arLoadData('Sobotta_RS43_TC023', 1); 
arLoadData('Sobotta_RS43_TC024', 1); 
arLoadData('Sobotta_RS43_TC025', 1); 
arLoadData('Sobotta_RS43_TC026', 1); 
arLoadData('Sobotta_RS43_TC027', 1); 
arLoadData('Sobotta_RS43_TC028', 1); 
arLoadData('Sobotta_RS43_TC029', 1); 
arLoadData('Sobotta_RS43_TC030', 1); 
arLoadData('Sobotta_RS43_TC031', 1); 
arLoadData('Sobotta_RS43_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS43_DR001', 1); 
arLoadData('Sobotta_RS43_DR002', 1); 
arLoadData('Sobotta_RS43_DR003', 1); 
arLoadData('Sobotta_RS43_DR004', 1); 
arLoadData('Sobotta_RS43_DR005', 1); 
arLoadData('Sobotta_RS43_DR006', 1); 
arLoadData('Sobotta_RS43_DR007', 1); 
arLoadData('Sobotta_RS43_DR008', 1); 
arLoadData('Sobotta_RS43_DR009', 1); 
arLoadData('Sobotta_RS43_DR010', 1); 
arLoadData('Sobotta_RS43_DR011', 1); 
arLoadData('Sobotta_RS43_DR012', 1); 
arLoadData('Sobotta_RS43_DR013', 1); 
arLoadData('Sobotta_RS43_DR014', 1); 
arLoadData('Sobotta_RS43_DR015', 1); 
arLoadData('Sobotta_RS43_DR016', 1); 
arLoadData('Sobotta_RS43_DR017', 1); 
arLoadData('Sobotta_RS43_DR018', 1); 
arLoadData('Sobotta_RS43_DR019', 1); 
arLoadData('Sobotta_RS43_DR020', 1); 
arLoadData('Sobotta_RS43_DR021', 1); 

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
arSave('Sobotta_RS43__Final', false, true); 


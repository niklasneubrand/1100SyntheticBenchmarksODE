% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS45 
% Random seed:		0001545000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS45'); 

% Load the time-course data 
arLoadData('Sobotta_RS45_TC001', 1); 
arLoadData('Sobotta_RS45_TC002', 1); 
arLoadData('Sobotta_RS45_TC003', 1); 
arLoadData('Sobotta_RS45_TC004', 1); 
arLoadData('Sobotta_RS45_TC005', 1); 
arLoadData('Sobotta_RS45_TC006', 1); 
arLoadData('Sobotta_RS45_TC007', 1); 
arLoadData('Sobotta_RS45_TC008', 1); 
arLoadData('Sobotta_RS45_TC009', 1); 
arLoadData('Sobotta_RS45_TC010', 1); 
arLoadData('Sobotta_RS45_TC011', 1); 
arLoadData('Sobotta_RS45_TC012', 1); 
arLoadData('Sobotta_RS45_TC013', 1); 
arLoadData('Sobotta_RS45_TC014', 1); 
arLoadData('Sobotta_RS45_TC015', 1); 
arLoadData('Sobotta_RS45_TC016', 1); 
arLoadData('Sobotta_RS45_TC017', 1); 
arLoadData('Sobotta_RS45_TC018', 1); 
arLoadData('Sobotta_RS45_TC019', 1); 
arLoadData('Sobotta_RS45_TC020', 1); 
arLoadData('Sobotta_RS45_TC021', 1); 
arLoadData('Sobotta_RS45_TC022', 1); 
arLoadData('Sobotta_RS45_TC023', 1); 
arLoadData('Sobotta_RS45_TC024', 1); 
arLoadData('Sobotta_RS45_TC025', 1); 
arLoadData('Sobotta_RS45_TC026', 1); 
arLoadData('Sobotta_RS45_TC027', 1); 
arLoadData('Sobotta_RS45_TC028', 1); 
arLoadData('Sobotta_RS45_TC029', 1); 
arLoadData('Sobotta_RS45_TC030', 1); 
arLoadData('Sobotta_RS45_TC031', 1); 
arLoadData('Sobotta_RS45_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS45_DR001', 1); 
arLoadData('Sobotta_RS45_DR002', 1); 
arLoadData('Sobotta_RS45_DR003', 1); 
arLoadData('Sobotta_RS45_DR004', 1); 
arLoadData('Sobotta_RS45_DR005', 1); 
arLoadData('Sobotta_RS45_DR006', 1); 
arLoadData('Sobotta_RS45_DR007', 1); 
arLoadData('Sobotta_RS45_DR008', 1); 
arLoadData('Sobotta_RS45_DR009', 1); 
arLoadData('Sobotta_RS45_DR010', 1); 
arLoadData('Sobotta_RS45_DR011', 1); 
arLoadData('Sobotta_RS45_DR012', 1); 
arLoadData('Sobotta_RS45_DR013', 1); 
arLoadData('Sobotta_RS45_DR014', 1); 
arLoadData('Sobotta_RS45_DR015', 1); 
arLoadData('Sobotta_RS45_DR016', 1); 
arLoadData('Sobotta_RS45_DR017', 1); 
arLoadData('Sobotta_RS45_DR018', 1); 
arLoadData('Sobotta_RS45_DR019', 1); 
arLoadData('Sobotta_RS45_DR020', 1); 
arLoadData('Sobotta_RS45_DR021', 1); 

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
arSave('Sobotta_RS45__Final', false, true); 


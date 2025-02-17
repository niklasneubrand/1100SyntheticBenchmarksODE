% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS41 
% Random seed:		0001541000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS41'); 

% Load the time-course data 
arLoadData('Sobotta_RS41_TC001', 1); 
arLoadData('Sobotta_RS41_TC002', 1); 
arLoadData('Sobotta_RS41_TC003', 1); 
arLoadData('Sobotta_RS41_TC004', 1); 
arLoadData('Sobotta_RS41_TC005', 1); 
arLoadData('Sobotta_RS41_TC006', 1); 
arLoadData('Sobotta_RS41_TC007', 1); 
arLoadData('Sobotta_RS41_TC008', 1); 
arLoadData('Sobotta_RS41_TC009', 1); 
arLoadData('Sobotta_RS41_TC010', 1); 
arLoadData('Sobotta_RS41_TC011', 1); 
arLoadData('Sobotta_RS41_TC012', 1); 
arLoadData('Sobotta_RS41_TC013', 1); 
arLoadData('Sobotta_RS41_TC014', 1); 
arLoadData('Sobotta_RS41_TC015', 1); 
arLoadData('Sobotta_RS41_TC016', 1); 
arLoadData('Sobotta_RS41_TC017', 1); 
arLoadData('Sobotta_RS41_TC018', 1); 
arLoadData('Sobotta_RS41_TC019', 1); 
arLoadData('Sobotta_RS41_TC020', 1); 
arLoadData('Sobotta_RS41_TC021', 1); 
arLoadData('Sobotta_RS41_TC022', 1); 
arLoadData('Sobotta_RS41_TC023', 1); 
arLoadData('Sobotta_RS41_TC024', 1); 
arLoadData('Sobotta_RS41_TC025', 1); 
arLoadData('Sobotta_RS41_TC026', 1); 
arLoadData('Sobotta_RS41_TC027', 1); 
arLoadData('Sobotta_RS41_TC028', 1); 
arLoadData('Sobotta_RS41_TC029', 1); 
arLoadData('Sobotta_RS41_TC030', 1); 
arLoadData('Sobotta_RS41_TC031', 1); 
arLoadData('Sobotta_RS41_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS41_DR001', 1); 
arLoadData('Sobotta_RS41_DR002', 1); 
arLoadData('Sobotta_RS41_DR003', 1); 
arLoadData('Sobotta_RS41_DR004', 1); 
arLoadData('Sobotta_RS41_DR005', 1); 
arLoadData('Sobotta_RS41_DR006', 1); 
arLoadData('Sobotta_RS41_DR007', 1); 
arLoadData('Sobotta_RS41_DR008', 1); 
arLoadData('Sobotta_RS41_DR009', 1); 
arLoadData('Sobotta_RS41_DR010', 1); 
arLoadData('Sobotta_RS41_DR011', 1); 
arLoadData('Sobotta_RS41_DR012', 1); 
arLoadData('Sobotta_RS41_DR013', 1); 
arLoadData('Sobotta_RS41_DR014', 1); 
arLoadData('Sobotta_RS41_DR015', 1); 
arLoadData('Sobotta_RS41_DR016', 1); 
arLoadData('Sobotta_RS41_DR017', 1); 
arLoadData('Sobotta_RS41_DR018', 1); 
arLoadData('Sobotta_RS41_DR019', 1); 
arLoadData('Sobotta_RS41_DR020', 1); 
arLoadData('Sobotta_RS41_DR021', 1); 

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
arSave('Sobotta_RS41__Final', false, true); 


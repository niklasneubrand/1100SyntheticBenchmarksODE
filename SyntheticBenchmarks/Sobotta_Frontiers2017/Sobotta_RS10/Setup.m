% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS10 
% Random seed:		0001510000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS10'); 

% Load the time-course data 
arLoadData('Sobotta_RS10_TC001', 1); 
arLoadData('Sobotta_RS10_TC002', 1); 
arLoadData('Sobotta_RS10_TC003', 1); 
arLoadData('Sobotta_RS10_TC004', 1); 
arLoadData('Sobotta_RS10_TC005', 1); 
arLoadData('Sobotta_RS10_TC006', 1); 
arLoadData('Sobotta_RS10_TC007', 1); 
arLoadData('Sobotta_RS10_TC008', 1); 
arLoadData('Sobotta_RS10_TC009', 1); 
arLoadData('Sobotta_RS10_TC010', 1); 
arLoadData('Sobotta_RS10_TC011', 1); 
arLoadData('Sobotta_RS10_TC012', 1); 
arLoadData('Sobotta_RS10_TC013', 1); 
arLoadData('Sobotta_RS10_TC014', 1); 
arLoadData('Sobotta_RS10_TC015', 1); 
arLoadData('Sobotta_RS10_TC016', 1); 
arLoadData('Sobotta_RS10_TC017', 1); 
arLoadData('Sobotta_RS10_TC018', 1); 
arLoadData('Sobotta_RS10_TC019', 1); 
arLoadData('Sobotta_RS10_TC020', 1); 
arLoadData('Sobotta_RS10_TC021', 1); 
arLoadData('Sobotta_RS10_TC022', 1); 
arLoadData('Sobotta_RS10_TC023', 1); 
arLoadData('Sobotta_RS10_TC024', 1); 
arLoadData('Sobotta_RS10_TC025', 1); 
arLoadData('Sobotta_RS10_TC026', 1); 
arLoadData('Sobotta_RS10_TC027', 1); 
arLoadData('Sobotta_RS10_TC028', 1); 
arLoadData('Sobotta_RS10_TC029', 1); 
arLoadData('Sobotta_RS10_TC030', 1); 
arLoadData('Sobotta_RS10_TC031', 1); 
arLoadData('Sobotta_RS10_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS10_DR001', 1); 
arLoadData('Sobotta_RS10_DR002', 1); 
arLoadData('Sobotta_RS10_DR003', 1); 
arLoadData('Sobotta_RS10_DR004', 1); 
arLoadData('Sobotta_RS10_DR005', 1); 
arLoadData('Sobotta_RS10_DR006', 1); 
arLoadData('Sobotta_RS10_DR007', 1); 
arLoadData('Sobotta_RS10_DR008', 1); 
arLoadData('Sobotta_RS10_DR009', 1); 
arLoadData('Sobotta_RS10_DR010', 1); 
arLoadData('Sobotta_RS10_DR011', 1); 
arLoadData('Sobotta_RS10_DR012', 1); 
arLoadData('Sobotta_RS10_DR013', 1); 
arLoadData('Sobotta_RS10_DR014', 1); 
arLoadData('Sobotta_RS10_DR015', 1); 
arLoadData('Sobotta_RS10_DR016', 1); 
arLoadData('Sobotta_RS10_DR017', 1); 
arLoadData('Sobotta_RS10_DR018', 1); 
arLoadData('Sobotta_RS10_DR019', 1); 
arLoadData('Sobotta_RS10_DR020', 1); 
arLoadData('Sobotta_RS10_DR021', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 16000; 
ar.config.eq_tol = 1.000000e-10; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC002'), 'all', {}, 1); 

% Save the project 
arSave('Sobotta_RS10__Final', false, true); 


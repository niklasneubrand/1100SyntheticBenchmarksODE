% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS48 
% Random seed:		0001548000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS48'); 

% Load the time-course data 
arLoadData('Sobotta_RS48_TC001', 1); 
arLoadData('Sobotta_RS48_TC002', 1); 
arLoadData('Sobotta_RS48_TC003', 1); 
arLoadData('Sobotta_RS48_TC004', 1); 
arLoadData('Sobotta_RS48_TC005', 1); 
arLoadData('Sobotta_RS48_TC006', 1); 
arLoadData('Sobotta_RS48_TC007', 1); 
arLoadData('Sobotta_RS48_TC008', 1); 
arLoadData('Sobotta_RS48_TC009', 1); 
arLoadData('Sobotta_RS48_TC010', 1); 
arLoadData('Sobotta_RS48_TC011', 1); 
arLoadData('Sobotta_RS48_TC012', 1); 
arLoadData('Sobotta_RS48_TC013', 1); 
arLoadData('Sobotta_RS48_TC014', 1); 
arLoadData('Sobotta_RS48_TC015', 1); 
arLoadData('Sobotta_RS48_TC016', 1); 
arLoadData('Sobotta_RS48_TC017', 1); 
arLoadData('Sobotta_RS48_TC018', 1); 
arLoadData('Sobotta_RS48_TC019', 1); 
arLoadData('Sobotta_RS48_TC020', 1); 
arLoadData('Sobotta_RS48_TC021', 1); 
arLoadData('Sobotta_RS48_TC022', 1); 
arLoadData('Sobotta_RS48_TC023', 1); 
arLoadData('Sobotta_RS48_TC024', 1); 
arLoadData('Sobotta_RS48_TC025', 1); 
arLoadData('Sobotta_RS48_TC026', 1); 
arLoadData('Sobotta_RS48_TC027', 1); 
arLoadData('Sobotta_RS48_TC028', 1); 
arLoadData('Sobotta_RS48_TC029', 1); 
arLoadData('Sobotta_RS48_TC030', 1); 
arLoadData('Sobotta_RS48_TC031', 1); 
arLoadData('Sobotta_RS48_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS48_DR001', 1); 
arLoadData('Sobotta_RS48_DR002', 1); 
arLoadData('Sobotta_RS48_DR003', 1); 
arLoadData('Sobotta_RS48_DR004', 1); 
arLoadData('Sobotta_RS48_DR005', 1); 
arLoadData('Sobotta_RS48_DR006', 1); 
arLoadData('Sobotta_RS48_DR007', 1); 
arLoadData('Sobotta_RS48_DR008', 1); 
arLoadData('Sobotta_RS48_DR009', 1); 
arLoadData('Sobotta_RS48_DR010', 1); 
arLoadData('Sobotta_RS48_DR011', 1); 
arLoadData('Sobotta_RS48_DR012', 1); 
arLoadData('Sobotta_RS48_DR013', 1); 
arLoadData('Sobotta_RS48_DR014', 1); 
arLoadData('Sobotta_RS48_DR015', 1); 
arLoadData('Sobotta_RS48_DR016', 1); 
arLoadData('Sobotta_RS48_DR017', 1); 
arLoadData('Sobotta_RS48_DR018', 1); 
arLoadData('Sobotta_RS48_DR019', 1); 
arLoadData('Sobotta_RS48_DR020', 1); 
arLoadData('Sobotta_RS48_DR021', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 8000; 
ar.config.eq_tol = 1.000000e-10; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC002'), 'all', {}, 1); 

% Save the project 
arSave('Sobotta_RS48__Final', false, true); 


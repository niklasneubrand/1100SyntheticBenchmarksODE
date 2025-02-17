% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS16 
% Random seed:		0001516000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS16'); 

% Load the time-course data 
arLoadData('Sobotta_RS16_TC001', 1); 
arLoadData('Sobotta_RS16_TC002', 1); 
arLoadData('Sobotta_RS16_TC003', 1); 
arLoadData('Sobotta_RS16_TC004', 1); 
arLoadData('Sobotta_RS16_TC005', 1); 
arLoadData('Sobotta_RS16_TC006', 1); 
arLoadData('Sobotta_RS16_TC007', 1); 
arLoadData('Sobotta_RS16_TC008', 1); 
arLoadData('Sobotta_RS16_TC009', 1); 
arLoadData('Sobotta_RS16_TC010', 1); 
arLoadData('Sobotta_RS16_TC011', 1); 
arLoadData('Sobotta_RS16_TC012', 1); 
arLoadData('Sobotta_RS16_TC013', 1); 
arLoadData('Sobotta_RS16_TC014', 1); 
arLoadData('Sobotta_RS16_TC015', 1); 
arLoadData('Sobotta_RS16_TC016', 1); 
arLoadData('Sobotta_RS16_TC017', 1); 
arLoadData('Sobotta_RS16_TC018', 1); 
arLoadData('Sobotta_RS16_TC019', 1); 
arLoadData('Sobotta_RS16_TC020', 1); 
arLoadData('Sobotta_RS16_TC021', 1); 
arLoadData('Sobotta_RS16_TC022', 1); 
arLoadData('Sobotta_RS16_TC023', 1); 
arLoadData('Sobotta_RS16_TC024', 1); 
arLoadData('Sobotta_RS16_TC025', 1); 
arLoadData('Sobotta_RS16_TC026', 1); 
arLoadData('Sobotta_RS16_TC027', 1); 
arLoadData('Sobotta_RS16_TC028', 1); 
arLoadData('Sobotta_RS16_TC029', 1); 
arLoadData('Sobotta_RS16_TC030', 1); 
arLoadData('Sobotta_RS16_TC031', 1); 
arLoadData('Sobotta_RS16_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS16_DR001', 1); 
arLoadData('Sobotta_RS16_DR002', 1); 
arLoadData('Sobotta_RS16_DR003', 1); 
arLoadData('Sobotta_RS16_DR004', 1); 
arLoadData('Sobotta_RS16_DR005', 1); 
arLoadData('Sobotta_RS16_DR006', 1); 
arLoadData('Sobotta_RS16_DR007', 1); 
arLoadData('Sobotta_RS16_DR008', 1); 
arLoadData('Sobotta_RS16_DR009', 1); 
arLoadData('Sobotta_RS16_DR010', 1); 
arLoadData('Sobotta_RS16_DR011', 1); 
arLoadData('Sobotta_RS16_DR012', 1); 
arLoadData('Sobotta_RS16_DR013', 1); 
arLoadData('Sobotta_RS16_DR014', 1); 
arLoadData('Sobotta_RS16_DR015', 1); 
arLoadData('Sobotta_RS16_DR016', 1); 
arLoadData('Sobotta_RS16_DR017', 1); 
arLoadData('Sobotta_RS16_DR018', 1); 
arLoadData('Sobotta_RS16_DR019', 1); 
arLoadData('Sobotta_RS16_DR020', 1); 
arLoadData('Sobotta_RS16_DR021', 1); 

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
arSave('Sobotta_RS16__Final', false, true); 


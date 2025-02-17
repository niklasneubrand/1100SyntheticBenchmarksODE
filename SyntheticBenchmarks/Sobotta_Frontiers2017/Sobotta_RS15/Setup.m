% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS15 
% Random seed:		0001515000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS15'); 

% Load the time-course data 
arLoadData('Sobotta_RS15_TC001', 1); 
arLoadData('Sobotta_RS15_TC002', 1); 
arLoadData('Sobotta_RS15_TC003', 1); 
arLoadData('Sobotta_RS15_TC004', 1); 
arLoadData('Sobotta_RS15_TC005', 1); 
arLoadData('Sobotta_RS15_TC006', 1); 
arLoadData('Sobotta_RS15_TC007', 1); 
arLoadData('Sobotta_RS15_TC008', 1); 
arLoadData('Sobotta_RS15_TC009', 1); 
arLoadData('Sobotta_RS15_TC010', 1); 
arLoadData('Sobotta_RS15_TC011', 1); 
arLoadData('Sobotta_RS15_TC012', 1); 
arLoadData('Sobotta_RS15_TC013', 1); 
arLoadData('Sobotta_RS15_TC014', 1); 
arLoadData('Sobotta_RS15_TC015', 1); 
arLoadData('Sobotta_RS15_TC016', 1); 
arLoadData('Sobotta_RS15_TC017', 1); 
arLoadData('Sobotta_RS15_TC018', 1); 
arLoadData('Sobotta_RS15_TC019', 1); 
arLoadData('Sobotta_RS15_TC020', 1); 
arLoadData('Sobotta_RS15_TC021', 1); 
arLoadData('Sobotta_RS15_TC022', 1); 
arLoadData('Sobotta_RS15_TC023', 1); 
arLoadData('Sobotta_RS15_TC024', 1); 
arLoadData('Sobotta_RS15_TC025', 1); 
arLoadData('Sobotta_RS15_TC026', 1); 
arLoadData('Sobotta_RS15_TC027', 1); 
arLoadData('Sobotta_RS15_TC028', 1); 
arLoadData('Sobotta_RS15_TC029', 1); 
arLoadData('Sobotta_RS15_TC030', 1); 
arLoadData('Sobotta_RS15_TC031', 1); 
arLoadData('Sobotta_RS15_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS15_DR001', 1); 
arLoadData('Sobotta_RS15_DR002', 1); 
arLoadData('Sobotta_RS15_DR003', 1); 
arLoadData('Sobotta_RS15_DR004', 1); 
arLoadData('Sobotta_RS15_DR005', 1); 
arLoadData('Sobotta_RS15_DR006', 1); 
arLoadData('Sobotta_RS15_DR007', 1); 
arLoadData('Sobotta_RS15_DR008', 1); 
arLoadData('Sobotta_RS15_DR009', 1); 
arLoadData('Sobotta_RS15_DR010', 1); 
arLoadData('Sobotta_RS15_DR011', 1); 
arLoadData('Sobotta_RS15_DR012', 1); 
arLoadData('Sobotta_RS15_DR013', 1); 
arLoadData('Sobotta_RS15_DR014', 1); 
arLoadData('Sobotta_RS15_DR015', 1); 
arLoadData('Sobotta_RS15_DR016', 1); 
arLoadData('Sobotta_RS15_DR017', 1); 
arLoadData('Sobotta_RS15_DR018', 1); 
arLoadData('Sobotta_RS15_DR019', 1); 
arLoadData('Sobotta_RS15_DR020', 1); 
arLoadData('Sobotta_RS15_DR021', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 4000; 
ar.config.eq_tol = 1.000000e-10; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC002'), 'all', {}, 1); 

% Save the project 
arSave('Sobotta_RS15__Final', false, true); 


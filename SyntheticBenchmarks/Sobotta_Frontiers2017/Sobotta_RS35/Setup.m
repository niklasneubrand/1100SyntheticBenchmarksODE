% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS35 
% Random seed:		0001535000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS35'); 

% Load the time-course data 
arLoadData('Sobotta_RS35_TC001', 1); 
arLoadData('Sobotta_RS35_TC002', 1); 
arLoadData('Sobotta_RS35_TC003', 1); 
arLoadData('Sobotta_RS35_TC004', 1); 
arLoadData('Sobotta_RS35_TC005', 1); 
arLoadData('Sobotta_RS35_TC006', 1); 
arLoadData('Sobotta_RS35_TC007', 1); 
arLoadData('Sobotta_RS35_TC008', 1); 
arLoadData('Sobotta_RS35_TC009', 1); 
arLoadData('Sobotta_RS35_TC010', 1); 
arLoadData('Sobotta_RS35_TC011', 1); 
arLoadData('Sobotta_RS35_TC012', 1); 
arLoadData('Sobotta_RS35_TC013', 1); 
arLoadData('Sobotta_RS35_TC014', 1); 
arLoadData('Sobotta_RS35_TC015', 1); 
arLoadData('Sobotta_RS35_TC016', 1); 
arLoadData('Sobotta_RS35_TC017', 1); 
arLoadData('Sobotta_RS35_TC018', 1); 
arLoadData('Sobotta_RS35_TC019', 1); 
arLoadData('Sobotta_RS35_TC020', 1); 
arLoadData('Sobotta_RS35_TC021', 1); 
arLoadData('Sobotta_RS35_TC022', 1); 
arLoadData('Sobotta_RS35_TC023', 1); 
arLoadData('Sobotta_RS35_TC024', 1); 
arLoadData('Sobotta_RS35_TC025', 1); 
arLoadData('Sobotta_RS35_TC026', 1); 
arLoadData('Sobotta_RS35_TC027', 1); 
arLoadData('Sobotta_RS35_TC028', 1); 
arLoadData('Sobotta_RS35_TC029', 1); 
arLoadData('Sobotta_RS35_TC030', 1); 
arLoadData('Sobotta_RS35_TC031', 1); 
arLoadData('Sobotta_RS35_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS35_DR001', 1); 
arLoadData('Sobotta_RS35_DR002', 1); 
arLoadData('Sobotta_RS35_DR003', 1); 
arLoadData('Sobotta_RS35_DR004', 1); 
arLoadData('Sobotta_RS35_DR005', 1); 
arLoadData('Sobotta_RS35_DR006', 1); 
arLoadData('Sobotta_RS35_DR007', 1); 
arLoadData('Sobotta_RS35_DR008', 1); 
arLoadData('Sobotta_RS35_DR009', 1); 
arLoadData('Sobotta_RS35_DR010', 1); 
arLoadData('Sobotta_RS35_DR011', 1); 
arLoadData('Sobotta_RS35_DR012', 1); 
arLoadData('Sobotta_RS35_DR013', 1); 
arLoadData('Sobotta_RS35_DR014', 1); 
arLoadData('Sobotta_RS35_DR015', 1); 
arLoadData('Sobotta_RS35_DR016', 1); 
arLoadData('Sobotta_RS35_DR017', 1); 
arLoadData('Sobotta_RS35_DR018', 1); 
arLoadData('Sobotta_RS35_DR019', 1); 
arLoadData('Sobotta_RS35_DR020', 1); 
arLoadData('Sobotta_RS35_DR021', 1); 

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
arSave('Sobotta_RS35__Final', false, true); 


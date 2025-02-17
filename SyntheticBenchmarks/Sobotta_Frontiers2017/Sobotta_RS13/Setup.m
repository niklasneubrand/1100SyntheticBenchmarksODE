% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS13 
% Random seed:		0001513000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS13'); 

% Load the time-course data 
arLoadData('Sobotta_RS13_TC001', 1); 
arLoadData('Sobotta_RS13_TC002', 1); 
arLoadData('Sobotta_RS13_TC003', 1); 
arLoadData('Sobotta_RS13_TC004', 1); 
arLoadData('Sobotta_RS13_TC005', 1); 
arLoadData('Sobotta_RS13_TC006', 1); 
arLoadData('Sobotta_RS13_TC007', 1); 
arLoadData('Sobotta_RS13_TC008', 1); 
arLoadData('Sobotta_RS13_TC009', 1); 
arLoadData('Sobotta_RS13_TC010', 1); 
arLoadData('Sobotta_RS13_TC011', 1); 
arLoadData('Sobotta_RS13_TC012', 1); 
arLoadData('Sobotta_RS13_TC013', 1); 
arLoadData('Sobotta_RS13_TC014', 1); 
arLoadData('Sobotta_RS13_TC015', 1); 
arLoadData('Sobotta_RS13_TC016', 1); 
arLoadData('Sobotta_RS13_TC017', 1); 
arLoadData('Sobotta_RS13_TC018', 1); 
arLoadData('Sobotta_RS13_TC019', 1); 
arLoadData('Sobotta_RS13_TC020', 1); 
arLoadData('Sobotta_RS13_TC021', 1); 
arLoadData('Sobotta_RS13_TC022', 1); 
arLoadData('Sobotta_RS13_TC023', 1); 
arLoadData('Sobotta_RS13_TC024', 1); 
arLoadData('Sobotta_RS13_TC025', 1); 
arLoadData('Sobotta_RS13_TC026', 1); 
arLoadData('Sobotta_RS13_TC027', 1); 
arLoadData('Sobotta_RS13_TC028', 1); 
arLoadData('Sobotta_RS13_TC029', 1); 
arLoadData('Sobotta_RS13_TC030', 1); 
arLoadData('Sobotta_RS13_TC031', 1); 
arLoadData('Sobotta_RS13_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS13_DR001', 1); 
arLoadData('Sobotta_RS13_DR002', 1); 
arLoadData('Sobotta_RS13_DR003', 1); 
arLoadData('Sobotta_RS13_DR004', 1); 
arLoadData('Sobotta_RS13_DR005', 1); 
arLoadData('Sobotta_RS13_DR006', 1); 
arLoadData('Sobotta_RS13_DR007', 1); 
arLoadData('Sobotta_RS13_DR008', 1); 
arLoadData('Sobotta_RS13_DR009', 1); 
arLoadData('Sobotta_RS13_DR010', 1); 
arLoadData('Sobotta_RS13_DR011', 1); 
arLoadData('Sobotta_RS13_DR012', 1); 
arLoadData('Sobotta_RS13_DR013', 1); 
arLoadData('Sobotta_RS13_DR014', 1); 
arLoadData('Sobotta_RS13_DR015', 1); 
arLoadData('Sobotta_RS13_DR016', 1); 
arLoadData('Sobotta_RS13_DR017', 1); 
arLoadData('Sobotta_RS13_DR018', 1); 
arLoadData('Sobotta_RS13_DR019', 1); 
arLoadData('Sobotta_RS13_DR020', 1); 
arLoadData('Sobotta_RS13_DR021', 1); 

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
arSave('Sobotta_RS13__Final', false, true); 


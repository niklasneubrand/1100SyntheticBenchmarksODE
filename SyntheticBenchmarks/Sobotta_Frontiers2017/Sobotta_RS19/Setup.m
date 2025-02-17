% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS19 
% Random seed:		0001519000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS19'); 

% Load the time-course data 
arLoadData('Sobotta_RS19_TC001', 1); 
arLoadData('Sobotta_RS19_TC002', 1); 
arLoadData('Sobotta_RS19_TC003', 1); 
arLoadData('Sobotta_RS19_TC004', 1); 
arLoadData('Sobotta_RS19_TC005', 1); 
arLoadData('Sobotta_RS19_TC006', 1); 
arLoadData('Sobotta_RS19_TC007', 1); 
arLoadData('Sobotta_RS19_TC008', 1); 
arLoadData('Sobotta_RS19_TC009', 1); 
arLoadData('Sobotta_RS19_TC010', 1); 
arLoadData('Sobotta_RS19_TC011', 1); 
arLoadData('Sobotta_RS19_TC012', 1); 
arLoadData('Sobotta_RS19_TC013', 1); 
arLoadData('Sobotta_RS19_TC014', 1); 
arLoadData('Sobotta_RS19_TC015', 1); 
arLoadData('Sobotta_RS19_TC016', 1); 
arLoadData('Sobotta_RS19_TC017', 1); 
arLoadData('Sobotta_RS19_TC018', 1); 
arLoadData('Sobotta_RS19_TC019', 1); 
arLoadData('Sobotta_RS19_TC020', 1); 
arLoadData('Sobotta_RS19_TC021', 1); 
arLoadData('Sobotta_RS19_TC022', 1); 
arLoadData('Sobotta_RS19_TC023', 1); 
arLoadData('Sobotta_RS19_TC024', 1); 
arLoadData('Sobotta_RS19_TC025', 1); 
arLoadData('Sobotta_RS19_TC026', 1); 
arLoadData('Sobotta_RS19_TC027', 1); 
arLoadData('Sobotta_RS19_TC028', 1); 
arLoadData('Sobotta_RS19_TC029', 1); 
arLoadData('Sobotta_RS19_TC030', 1); 
arLoadData('Sobotta_RS19_TC031', 1); 
arLoadData('Sobotta_RS19_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS19_DR001', 1); 
arLoadData('Sobotta_RS19_DR002', 1); 
arLoadData('Sobotta_RS19_DR003', 1); 
arLoadData('Sobotta_RS19_DR004', 1); 
arLoadData('Sobotta_RS19_DR005', 1); 
arLoadData('Sobotta_RS19_DR006', 1); 
arLoadData('Sobotta_RS19_DR007', 1); 
arLoadData('Sobotta_RS19_DR008', 1); 
arLoadData('Sobotta_RS19_DR009', 1); 
arLoadData('Sobotta_RS19_DR010', 1); 
arLoadData('Sobotta_RS19_DR011', 1); 
arLoadData('Sobotta_RS19_DR012', 1); 
arLoadData('Sobotta_RS19_DR013', 1); 
arLoadData('Sobotta_RS19_DR014', 1); 
arLoadData('Sobotta_RS19_DR015', 1); 
arLoadData('Sobotta_RS19_DR016', 1); 
arLoadData('Sobotta_RS19_DR017', 1); 
arLoadData('Sobotta_RS19_DR018', 1); 
arLoadData('Sobotta_RS19_DR019', 1); 
arLoadData('Sobotta_RS19_DR020', 1); 
arLoadData('Sobotta_RS19_DR021', 1); 

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
arSave('Sobotta_RS19__Final', false, true); 


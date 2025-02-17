% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS49 
% Random seed:		0001549000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS49'); 

% Load the time-course data 
arLoadData('Sobotta_RS49_TC001', 1); 
arLoadData('Sobotta_RS49_TC002', 1); 
arLoadData('Sobotta_RS49_TC003', 1); 
arLoadData('Sobotta_RS49_TC004', 1); 
arLoadData('Sobotta_RS49_TC005', 1); 
arLoadData('Sobotta_RS49_TC006', 1); 
arLoadData('Sobotta_RS49_TC007', 1); 
arLoadData('Sobotta_RS49_TC008', 1); 
arLoadData('Sobotta_RS49_TC009', 1); 
arLoadData('Sobotta_RS49_TC010', 1); 
arLoadData('Sobotta_RS49_TC011', 1); 
arLoadData('Sobotta_RS49_TC012', 1); 
arLoadData('Sobotta_RS49_TC013', 1); 
arLoadData('Sobotta_RS49_TC014', 1); 
arLoadData('Sobotta_RS49_TC015', 1); 
arLoadData('Sobotta_RS49_TC016', 1); 
arLoadData('Sobotta_RS49_TC017', 1); 
arLoadData('Sobotta_RS49_TC018', 1); 
arLoadData('Sobotta_RS49_TC019', 1); 
arLoadData('Sobotta_RS49_TC020', 1); 
arLoadData('Sobotta_RS49_TC021', 1); 
arLoadData('Sobotta_RS49_TC022', 1); 
arLoadData('Sobotta_RS49_TC023', 1); 
arLoadData('Sobotta_RS49_TC024', 1); 
arLoadData('Sobotta_RS49_TC025', 1); 
arLoadData('Sobotta_RS49_TC026', 1); 
arLoadData('Sobotta_RS49_TC027', 1); 
arLoadData('Sobotta_RS49_TC028', 1); 
arLoadData('Sobotta_RS49_TC029', 1); 
arLoadData('Sobotta_RS49_TC030', 1); 
arLoadData('Sobotta_RS49_TC031', 1); 
arLoadData('Sobotta_RS49_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS49_DR001', 1); 
arLoadData('Sobotta_RS49_DR002', 1); 
arLoadData('Sobotta_RS49_DR003', 1); 
arLoadData('Sobotta_RS49_DR004', 1); 
arLoadData('Sobotta_RS49_DR005', 1); 
arLoadData('Sobotta_RS49_DR006', 1); 
arLoadData('Sobotta_RS49_DR007', 1); 
arLoadData('Sobotta_RS49_DR008', 1); 
arLoadData('Sobotta_RS49_DR009', 1); 
arLoadData('Sobotta_RS49_DR010', 1); 
arLoadData('Sobotta_RS49_DR011', 1); 
arLoadData('Sobotta_RS49_DR012', 1); 
arLoadData('Sobotta_RS49_DR013', 1); 
arLoadData('Sobotta_RS49_DR014', 1); 
arLoadData('Sobotta_RS49_DR015', 1); 
arLoadData('Sobotta_RS49_DR016', 1); 
arLoadData('Sobotta_RS49_DR017', 1); 
arLoadData('Sobotta_RS49_DR018', 1); 
arLoadData('Sobotta_RS49_DR019', 1); 
arLoadData('Sobotta_RS49_DR020', 1); 
arLoadData('Sobotta_RS49_DR021', 1); 

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
arSave('Sobotta_RS49__Final', false, true); 


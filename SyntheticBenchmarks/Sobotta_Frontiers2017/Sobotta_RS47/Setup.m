% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS47 
% Random seed:		0001547000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS47'); 

% Load the time-course data 
arLoadData('Sobotta_RS47_TC001', 1); 
arLoadData('Sobotta_RS47_TC002', 1); 
arLoadData('Sobotta_RS47_TC003', 1); 
arLoadData('Sobotta_RS47_TC004', 1); 
arLoadData('Sobotta_RS47_TC005', 1); 
arLoadData('Sobotta_RS47_TC006', 1); 
arLoadData('Sobotta_RS47_TC007', 1); 
arLoadData('Sobotta_RS47_TC008', 1); 
arLoadData('Sobotta_RS47_TC009', 1); 
arLoadData('Sobotta_RS47_TC010', 1); 
arLoadData('Sobotta_RS47_TC011', 1); 
arLoadData('Sobotta_RS47_TC012', 1); 
arLoadData('Sobotta_RS47_TC013', 1); 
arLoadData('Sobotta_RS47_TC014', 1); 
arLoadData('Sobotta_RS47_TC015', 1); 
arLoadData('Sobotta_RS47_TC016', 1); 
arLoadData('Sobotta_RS47_TC017', 1); 
arLoadData('Sobotta_RS47_TC018', 1); 
arLoadData('Sobotta_RS47_TC019', 1); 
arLoadData('Sobotta_RS47_TC020', 1); 
arLoadData('Sobotta_RS47_TC021', 1); 
arLoadData('Sobotta_RS47_TC022', 1); 
arLoadData('Sobotta_RS47_TC023', 1); 
arLoadData('Sobotta_RS47_TC024', 1); 
arLoadData('Sobotta_RS47_TC025', 1); 
arLoadData('Sobotta_RS47_TC026', 1); 
arLoadData('Sobotta_RS47_TC027', 1); 
arLoadData('Sobotta_RS47_TC028', 1); 
arLoadData('Sobotta_RS47_TC029', 1); 
arLoadData('Sobotta_RS47_TC030', 1); 
arLoadData('Sobotta_RS47_TC031', 1); 
arLoadData('Sobotta_RS47_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS47_DR001', 1); 
arLoadData('Sobotta_RS47_DR002', 1); 
arLoadData('Sobotta_RS47_DR003', 1); 
arLoadData('Sobotta_RS47_DR004', 1); 
arLoadData('Sobotta_RS47_DR005', 1); 
arLoadData('Sobotta_RS47_DR006', 1); 
arLoadData('Sobotta_RS47_DR007', 1); 
arLoadData('Sobotta_RS47_DR008', 1); 
arLoadData('Sobotta_RS47_DR009', 1); 
arLoadData('Sobotta_RS47_DR010', 1); 
arLoadData('Sobotta_RS47_DR011', 1); 
arLoadData('Sobotta_RS47_DR012', 1); 
arLoadData('Sobotta_RS47_DR013', 1); 
arLoadData('Sobotta_RS47_DR014', 1); 
arLoadData('Sobotta_RS47_DR015', 1); 
arLoadData('Sobotta_RS47_DR016', 1); 
arLoadData('Sobotta_RS47_DR017', 1); 
arLoadData('Sobotta_RS47_DR018', 1); 
arLoadData('Sobotta_RS47_DR019', 1); 
arLoadData('Sobotta_RS47_DR020', 1); 
arLoadData('Sobotta_RS47_DR021', 1); 

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
arSave('Sobotta_RS47__Final', false, true); 


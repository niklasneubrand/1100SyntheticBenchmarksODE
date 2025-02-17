% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS20 
% Random seed:		0001520000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS20'); 

% Load the time-course data 
arLoadData('Sobotta_RS20_TC001', 1); 
arLoadData('Sobotta_RS20_TC002', 1); 
arLoadData('Sobotta_RS20_TC003', 1); 
arLoadData('Sobotta_RS20_TC004', 1); 
arLoadData('Sobotta_RS20_TC005', 1); 
arLoadData('Sobotta_RS20_TC006', 1); 
arLoadData('Sobotta_RS20_TC007', 1); 
arLoadData('Sobotta_RS20_TC008', 1); 
arLoadData('Sobotta_RS20_TC009', 1); 
arLoadData('Sobotta_RS20_TC010', 1); 
arLoadData('Sobotta_RS20_TC011', 1); 
arLoadData('Sobotta_RS20_TC012', 1); 
arLoadData('Sobotta_RS20_TC013', 1); 
arLoadData('Sobotta_RS20_TC014', 1); 
arLoadData('Sobotta_RS20_TC015', 1); 
arLoadData('Sobotta_RS20_TC016', 1); 
arLoadData('Sobotta_RS20_TC017', 1); 
arLoadData('Sobotta_RS20_TC018', 1); 
arLoadData('Sobotta_RS20_TC019', 1); 
arLoadData('Sobotta_RS20_TC020', 1); 
arLoadData('Sobotta_RS20_TC021', 1); 
arLoadData('Sobotta_RS20_TC022', 1); 
arLoadData('Sobotta_RS20_TC023', 1); 
arLoadData('Sobotta_RS20_TC024', 1); 
arLoadData('Sobotta_RS20_TC025', 1); 
arLoadData('Sobotta_RS20_TC026', 1); 
arLoadData('Sobotta_RS20_TC027', 1); 
arLoadData('Sobotta_RS20_TC028', 1); 
arLoadData('Sobotta_RS20_TC029', 1); 
arLoadData('Sobotta_RS20_TC030', 1); 
arLoadData('Sobotta_RS20_TC031', 1); 
arLoadData('Sobotta_RS20_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS20_DR001', 1); 
arLoadData('Sobotta_RS20_DR002', 1); 
arLoadData('Sobotta_RS20_DR003', 1); 
arLoadData('Sobotta_RS20_DR004', 1); 
arLoadData('Sobotta_RS20_DR005', 1); 
arLoadData('Sobotta_RS20_DR006', 1); 
arLoadData('Sobotta_RS20_DR007', 1); 
arLoadData('Sobotta_RS20_DR008', 1); 
arLoadData('Sobotta_RS20_DR009', 1); 
arLoadData('Sobotta_RS20_DR010', 1); 
arLoadData('Sobotta_RS20_DR011', 1); 
arLoadData('Sobotta_RS20_DR012', 1); 
arLoadData('Sobotta_RS20_DR013', 1); 
arLoadData('Sobotta_RS20_DR014', 1); 
arLoadData('Sobotta_RS20_DR015', 1); 
arLoadData('Sobotta_RS20_DR016', 1); 
arLoadData('Sobotta_RS20_DR017', 1); 
arLoadData('Sobotta_RS20_DR018', 1); 
arLoadData('Sobotta_RS20_DR019', 1); 
arLoadData('Sobotta_RS20_DR020', 1); 
arLoadData('Sobotta_RS20_DR021', 1); 

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
arSave('Sobotta_RS20__Final', false, true); 


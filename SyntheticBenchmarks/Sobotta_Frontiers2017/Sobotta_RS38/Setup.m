% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS38 
% Random seed:		0001538000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS38'); 

% Load the time-course data 
arLoadData('Sobotta_RS38_TC001', 1); 
arLoadData('Sobotta_RS38_TC002', 1); 
arLoadData('Sobotta_RS38_TC003', 1); 
arLoadData('Sobotta_RS38_TC004', 1); 
arLoadData('Sobotta_RS38_TC005', 1); 
arLoadData('Sobotta_RS38_TC006', 1); 
arLoadData('Sobotta_RS38_TC007', 1); 
arLoadData('Sobotta_RS38_TC008', 1); 
arLoadData('Sobotta_RS38_TC009', 1); 
arLoadData('Sobotta_RS38_TC010', 1); 
arLoadData('Sobotta_RS38_TC011', 1); 
arLoadData('Sobotta_RS38_TC012', 1); 
arLoadData('Sobotta_RS38_TC013', 1); 
arLoadData('Sobotta_RS38_TC014', 1); 
arLoadData('Sobotta_RS38_TC015', 1); 
arLoadData('Sobotta_RS38_TC016', 1); 
arLoadData('Sobotta_RS38_TC017', 1); 
arLoadData('Sobotta_RS38_TC018', 1); 
arLoadData('Sobotta_RS38_TC019', 1); 
arLoadData('Sobotta_RS38_TC020', 1); 
arLoadData('Sobotta_RS38_TC021', 1); 
arLoadData('Sobotta_RS38_TC022', 1); 
arLoadData('Sobotta_RS38_TC023', 1); 
arLoadData('Sobotta_RS38_TC024', 1); 
arLoadData('Sobotta_RS38_TC025', 1); 
arLoadData('Sobotta_RS38_TC026', 1); 
arLoadData('Sobotta_RS38_TC027', 1); 
arLoadData('Sobotta_RS38_TC028', 1); 
arLoadData('Sobotta_RS38_TC029', 1); 
arLoadData('Sobotta_RS38_TC030', 1); 
arLoadData('Sobotta_RS38_TC031', 1); 
arLoadData('Sobotta_RS38_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS38_DR001', 1); 
arLoadData('Sobotta_RS38_DR002', 1); 
arLoadData('Sobotta_RS38_DR003', 1); 
arLoadData('Sobotta_RS38_DR004', 1); 
arLoadData('Sobotta_RS38_DR005', 1); 
arLoadData('Sobotta_RS38_DR006', 1); 
arLoadData('Sobotta_RS38_DR007', 1); 
arLoadData('Sobotta_RS38_DR008', 1); 
arLoadData('Sobotta_RS38_DR009', 1); 
arLoadData('Sobotta_RS38_DR010', 1); 
arLoadData('Sobotta_RS38_DR011', 1); 
arLoadData('Sobotta_RS38_DR012', 1); 
arLoadData('Sobotta_RS38_DR013', 1); 
arLoadData('Sobotta_RS38_DR014', 1); 
arLoadData('Sobotta_RS38_DR015', 1); 
arLoadData('Sobotta_RS38_DR016', 1); 
arLoadData('Sobotta_RS38_DR017', 1); 
arLoadData('Sobotta_RS38_DR018', 1); 
arLoadData('Sobotta_RS38_DR019', 1); 
arLoadData('Sobotta_RS38_DR020', 1); 
arLoadData('Sobotta_RS38_DR021', 1); 

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
arSave('Sobotta_RS38__Final', false, true); 


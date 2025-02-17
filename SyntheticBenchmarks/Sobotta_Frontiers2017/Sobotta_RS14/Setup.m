% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS14 
% Random seed:		0001514010 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS14'); 

% Load the time-course data 
arLoadData('Sobotta_RS14_TC001', 1); 
arLoadData('Sobotta_RS14_TC002', 1); 
arLoadData('Sobotta_RS14_TC003', 1); 
arLoadData('Sobotta_RS14_TC004', 1); 
arLoadData('Sobotta_RS14_TC005', 1); 
arLoadData('Sobotta_RS14_TC006', 1); 
arLoadData('Sobotta_RS14_TC007', 1); 
arLoadData('Sobotta_RS14_TC008', 1); 
arLoadData('Sobotta_RS14_TC009', 1); 
arLoadData('Sobotta_RS14_TC010', 1); 
arLoadData('Sobotta_RS14_TC011', 1); 
arLoadData('Sobotta_RS14_TC012', 1); 
arLoadData('Sobotta_RS14_TC013', 1); 
arLoadData('Sobotta_RS14_TC014', 1); 
arLoadData('Sobotta_RS14_TC015', 1); 
arLoadData('Sobotta_RS14_TC016', 1); 
arLoadData('Sobotta_RS14_TC017', 1); 
arLoadData('Sobotta_RS14_TC018', 1); 
arLoadData('Sobotta_RS14_TC019', 1); 
arLoadData('Sobotta_RS14_TC020', 1); 
arLoadData('Sobotta_RS14_TC021', 1); 
arLoadData('Sobotta_RS14_TC022', 1); 
arLoadData('Sobotta_RS14_TC023', 1); 
arLoadData('Sobotta_RS14_TC024', 1); 
arLoadData('Sobotta_RS14_TC025', 1); 
arLoadData('Sobotta_RS14_TC026', 1); 
arLoadData('Sobotta_RS14_TC027', 1); 
arLoadData('Sobotta_RS14_TC028', 1); 
arLoadData('Sobotta_RS14_TC029', 1); 
arLoadData('Sobotta_RS14_TC030', 1); 
arLoadData('Sobotta_RS14_TC031', 1); 
arLoadData('Sobotta_RS14_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS14_DR001', 1); 
arLoadData('Sobotta_RS14_DR002', 1); 
arLoadData('Sobotta_RS14_DR003', 1); 
arLoadData('Sobotta_RS14_DR004', 1); 
arLoadData('Sobotta_RS14_DR005', 1); 
arLoadData('Sobotta_RS14_DR006', 1); 
arLoadData('Sobotta_RS14_DR007', 1); 
arLoadData('Sobotta_RS14_DR008', 1); 
arLoadData('Sobotta_RS14_DR009', 1); 
arLoadData('Sobotta_RS14_DR010', 1); 
arLoadData('Sobotta_RS14_DR011', 1); 
arLoadData('Sobotta_RS14_DR012', 1); 
arLoadData('Sobotta_RS14_DR013', 1); 
arLoadData('Sobotta_RS14_DR014', 1); 
arLoadData('Sobotta_RS14_DR015', 1); 
arLoadData('Sobotta_RS14_DR016', 1); 
arLoadData('Sobotta_RS14_DR017', 1); 
arLoadData('Sobotta_RS14_DR018', 1); 
arLoadData('Sobotta_RS14_DR019', 1); 
arLoadData('Sobotta_RS14_DR020', 1); 
arLoadData('Sobotta_RS14_DR021', 1); 

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
arSave('Sobotta_RS14__Final', false, true); 


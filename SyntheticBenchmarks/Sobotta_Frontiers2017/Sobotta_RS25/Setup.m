% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS25 
% Random seed:		0001525000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS25'); 

% Load the time-course data 
arLoadData('Sobotta_RS25_TC001', 1); 
arLoadData('Sobotta_RS25_TC002', 1); 
arLoadData('Sobotta_RS25_TC003', 1); 
arLoadData('Sobotta_RS25_TC004', 1); 
arLoadData('Sobotta_RS25_TC005', 1); 
arLoadData('Sobotta_RS25_TC006', 1); 
arLoadData('Sobotta_RS25_TC007', 1); 
arLoadData('Sobotta_RS25_TC008', 1); 
arLoadData('Sobotta_RS25_TC009', 1); 
arLoadData('Sobotta_RS25_TC010', 1); 
arLoadData('Sobotta_RS25_TC011', 1); 
arLoadData('Sobotta_RS25_TC012', 1); 
arLoadData('Sobotta_RS25_TC013', 1); 
arLoadData('Sobotta_RS25_TC014', 1); 
arLoadData('Sobotta_RS25_TC015', 1); 
arLoadData('Sobotta_RS25_TC016', 1); 
arLoadData('Sobotta_RS25_TC017', 1); 
arLoadData('Sobotta_RS25_TC018', 1); 
arLoadData('Sobotta_RS25_TC019', 1); 
arLoadData('Sobotta_RS25_TC020', 1); 
arLoadData('Sobotta_RS25_TC021', 1); 
arLoadData('Sobotta_RS25_TC022', 1); 
arLoadData('Sobotta_RS25_TC023', 1); 
arLoadData('Sobotta_RS25_TC024', 1); 
arLoadData('Sobotta_RS25_TC025', 1); 
arLoadData('Sobotta_RS25_TC026', 1); 
arLoadData('Sobotta_RS25_TC027', 1); 
arLoadData('Sobotta_RS25_TC028', 1); 
arLoadData('Sobotta_RS25_TC029', 1); 
arLoadData('Sobotta_RS25_TC030', 1); 
arLoadData('Sobotta_RS25_TC031', 1); 
arLoadData('Sobotta_RS25_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS25_DR001', 1); 
arLoadData('Sobotta_RS25_DR002', 1); 
arLoadData('Sobotta_RS25_DR003', 1); 
arLoadData('Sobotta_RS25_DR004', 1); 
arLoadData('Sobotta_RS25_DR005', 1); 
arLoadData('Sobotta_RS25_DR006', 1); 
arLoadData('Sobotta_RS25_DR007', 1); 
arLoadData('Sobotta_RS25_DR008', 1); 
arLoadData('Sobotta_RS25_DR009', 1); 
arLoadData('Sobotta_RS25_DR010', 1); 
arLoadData('Sobotta_RS25_DR011', 1); 
arLoadData('Sobotta_RS25_DR012', 1); 
arLoadData('Sobotta_RS25_DR013', 1); 
arLoadData('Sobotta_RS25_DR014', 1); 
arLoadData('Sobotta_RS25_DR015', 1); 
arLoadData('Sobotta_RS25_DR016', 1); 
arLoadData('Sobotta_RS25_DR017', 1); 
arLoadData('Sobotta_RS25_DR018', 1); 
arLoadData('Sobotta_RS25_DR019', 1); 
arLoadData('Sobotta_RS25_DR020', 1); 
arLoadData('Sobotta_RS25_DR021', 1); 

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
arSave('Sobotta_RS25__Final', false, true); 


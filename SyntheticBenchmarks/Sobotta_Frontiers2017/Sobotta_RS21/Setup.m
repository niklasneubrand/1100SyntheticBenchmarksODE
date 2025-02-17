% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS21 
% Random seed:		0001521000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS21'); 

% Load the time-course data 
arLoadData('Sobotta_RS21_TC001', 1); 
arLoadData('Sobotta_RS21_TC002', 1); 
arLoadData('Sobotta_RS21_TC003', 1); 
arLoadData('Sobotta_RS21_TC004', 1); 
arLoadData('Sobotta_RS21_TC005', 1); 
arLoadData('Sobotta_RS21_TC006', 1); 
arLoadData('Sobotta_RS21_TC007', 1); 
arLoadData('Sobotta_RS21_TC008', 1); 
arLoadData('Sobotta_RS21_TC009', 1); 
arLoadData('Sobotta_RS21_TC010', 1); 
arLoadData('Sobotta_RS21_TC011', 1); 
arLoadData('Sobotta_RS21_TC012', 1); 
arLoadData('Sobotta_RS21_TC013', 1); 
arLoadData('Sobotta_RS21_TC014', 1); 
arLoadData('Sobotta_RS21_TC015', 1); 
arLoadData('Sobotta_RS21_TC016', 1); 
arLoadData('Sobotta_RS21_TC017', 1); 
arLoadData('Sobotta_RS21_TC018', 1); 
arLoadData('Sobotta_RS21_TC019', 1); 
arLoadData('Sobotta_RS21_TC020', 1); 
arLoadData('Sobotta_RS21_TC021', 1); 
arLoadData('Sobotta_RS21_TC022', 1); 
arLoadData('Sobotta_RS21_TC023', 1); 
arLoadData('Sobotta_RS21_TC024', 1); 
arLoadData('Sobotta_RS21_TC025', 1); 
arLoadData('Sobotta_RS21_TC026', 1); 
arLoadData('Sobotta_RS21_TC027', 1); 
arLoadData('Sobotta_RS21_TC028', 1); 
arLoadData('Sobotta_RS21_TC029', 1); 
arLoadData('Sobotta_RS21_TC030', 1); 
arLoadData('Sobotta_RS21_TC031', 1); 
arLoadData('Sobotta_RS21_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS21_DR001', 1); 
arLoadData('Sobotta_RS21_DR002', 1); 
arLoadData('Sobotta_RS21_DR003', 1); 
arLoadData('Sobotta_RS21_DR004', 1); 
arLoadData('Sobotta_RS21_DR005', 1); 
arLoadData('Sobotta_RS21_DR006', 1); 
arLoadData('Sobotta_RS21_DR007', 1); 
arLoadData('Sobotta_RS21_DR008', 1); 
arLoadData('Sobotta_RS21_DR009', 1); 
arLoadData('Sobotta_RS21_DR010', 1); 
arLoadData('Sobotta_RS21_DR011', 1); 
arLoadData('Sobotta_RS21_DR012', 1); 
arLoadData('Sobotta_RS21_DR013', 1); 
arLoadData('Sobotta_RS21_DR014', 1); 
arLoadData('Sobotta_RS21_DR015', 1); 
arLoadData('Sobotta_RS21_DR016', 1); 
arLoadData('Sobotta_RS21_DR017', 1); 
arLoadData('Sobotta_RS21_DR018', 1); 
arLoadData('Sobotta_RS21_DR019', 1); 
arLoadData('Sobotta_RS21_DR020', 1); 
arLoadData('Sobotta_RS21_DR021', 1); 

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
arSave('Sobotta_RS21__Final', false, true); 


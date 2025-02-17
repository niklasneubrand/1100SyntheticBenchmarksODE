% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS23 
% Random seed:		0001523000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS23'); 

% Load the time-course data 
arLoadData('Sobotta_RS23_TC001', 1); 
arLoadData('Sobotta_RS23_TC002', 1); 
arLoadData('Sobotta_RS23_TC003', 1); 
arLoadData('Sobotta_RS23_TC004', 1); 
arLoadData('Sobotta_RS23_TC005', 1); 
arLoadData('Sobotta_RS23_TC006', 1); 
arLoadData('Sobotta_RS23_TC007', 1); 
arLoadData('Sobotta_RS23_TC008', 1); 
arLoadData('Sobotta_RS23_TC009', 1); 
arLoadData('Sobotta_RS23_TC010', 1); 
arLoadData('Sobotta_RS23_TC011', 1); 
arLoadData('Sobotta_RS23_TC012', 1); 
arLoadData('Sobotta_RS23_TC013', 1); 
arLoadData('Sobotta_RS23_TC014', 1); 
arLoadData('Sobotta_RS23_TC015', 1); 
arLoadData('Sobotta_RS23_TC016', 1); 
arLoadData('Sobotta_RS23_TC017', 1); 
arLoadData('Sobotta_RS23_TC018', 1); 
arLoadData('Sobotta_RS23_TC019', 1); 
arLoadData('Sobotta_RS23_TC020', 1); 
arLoadData('Sobotta_RS23_TC021', 1); 
arLoadData('Sobotta_RS23_TC022', 1); 
arLoadData('Sobotta_RS23_TC023', 1); 
arLoadData('Sobotta_RS23_TC024', 1); 
arLoadData('Sobotta_RS23_TC025', 1); 
arLoadData('Sobotta_RS23_TC026', 1); 
arLoadData('Sobotta_RS23_TC027', 1); 
arLoadData('Sobotta_RS23_TC028', 1); 
arLoadData('Sobotta_RS23_TC029', 1); 
arLoadData('Sobotta_RS23_TC030', 1); 
arLoadData('Sobotta_RS23_TC031', 1); 
arLoadData('Sobotta_RS23_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS23_DR001', 1); 
arLoadData('Sobotta_RS23_DR002', 1); 
arLoadData('Sobotta_RS23_DR003', 1); 
arLoadData('Sobotta_RS23_DR004', 1); 
arLoadData('Sobotta_RS23_DR005', 1); 
arLoadData('Sobotta_RS23_DR006', 1); 
arLoadData('Sobotta_RS23_DR007', 1); 
arLoadData('Sobotta_RS23_DR008', 1); 
arLoadData('Sobotta_RS23_DR009', 1); 
arLoadData('Sobotta_RS23_DR010', 1); 
arLoadData('Sobotta_RS23_DR011', 1); 
arLoadData('Sobotta_RS23_DR012', 1); 
arLoadData('Sobotta_RS23_DR013', 1); 
arLoadData('Sobotta_RS23_DR014', 1); 
arLoadData('Sobotta_RS23_DR015', 1); 
arLoadData('Sobotta_RS23_DR016', 1); 
arLoadData('Sobotta_RS23_DR017', 1); 
arLoadData('Sobotta_RS23_DR018', 1); 
arLoadData('Sobotta_RS23_DR019', 1); 
arLoadData('Sobotta_RS23_DR020', 1); 
arLoadData('Sobotta_RS23_DR021', 1); 

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
arSave('Sobotta_RS23__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS17 
% Random seed:		0001517000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS17'); 

% Load the time-course data 
arLoadData('Sobotta_RS17_TC001', 1); 
arLoadData('Sobotta_RS17_TC002', 1); 
arLoadData('Sobotta_RS17_TC003', 1); 
arLoadData('Sobotta_RS17_TC004', 1); 
arLoadData('Sobotta_RS17_TC005', 1); 
arLoadData('Sobotta_RS17_TC006', 1); 
arLoadData('Sobotta_RS17_TC007', 1); 
arLoadData('Sobotta_RS17_TC008', 1); 
arLoadData('Sobotta_RS17_TC009', 1); 
arLoadData('Sobotta_RS17_TC010', 1); 
arLoadData('Sobotta_RS17_TC011', 1); 
arLoadData('Sobotta_RS17_TC012', 1); 
arLoadData('Sobotta_RS17_TC013', 1); 
arLoadData('Sobotta_RS17_TC014', 1); 
arLoadData('Sobotta_RS17_TC015', 1); 
arLoadData('Sobotta_RS17_TC016', 1); 
arLoadData('Sobotta_RS17_TC017', 1); 
arLoadData('Sobotta_RS17_TC018', 1); 
arLoadData('Sobotta_RS17_TC019', 1); 
arLoadData('Sobotta_RS17_TC020', 1); 
arLoadData('Sobotta_RS17_TC021', 1); 
arLoadData('Sobotta_RS17_TC022', 1); 
arLoadData('Sobotta_RS17_TC023', 1); 
arLoadData('Sobotta_RS17_TC024', 1); 
arLoadData('Sobotta_RS17_TC025', 1); 
arLoadData('Sobotta_RS17_TC026', 1); 
arLoadData('Sobotta_RS17_TC027', 1); 
arLoadData('Sobotta_RS17_TC028', 1); 
arLoadData('Sobotta_RS17_TC029', 1); 
arLoadData('Sobotta_RS17_TC030', 1); 
arLoadData('Sobotta_RS17_TC031', 1); 
arLoadData('Sobotta_RS17_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS17_DR001', 1); 
arLoadData('Sobotta_RS17_DR002', 1); 
arLoadData('Sobotta_RS17_DR003', 1); 
arLoadData('Sobotta_RS17_DR004', 1); 
arLoadData('Sobotta_RS17_DR005', 1); 
arLoadData('Sobotta_RS17_DR006', 1); 
arLoadData('Sobotta_RS17_DR007', 1); 
arLoadData('Sobotta_RS17_DR008', 1); 
arLoadData('Sobotta_RS17_DR009', 1); 
arLoadData('Sobotta_RS17_DR010', 1); 
arLoadData('Sobotta_RS17_DR011', 1); 
arLoadData('Sobotta_RS17_DR012', 1); 
arLoadData('Sobotta_RS17_DR013', 1); 
arLoadData('Sobotta_RS17_DR014', 1); 
arLoadData('Sobotta_RS17_DR015', 1); 
arLoadData('Sobotta_RS17_DR016', 1); 
arLoadData('Sobotta_RS17_DR017', 1); 
arLoadData('Sobotta_RS17_DR018', 1); 
arLoadData('Sobotta_RS17_DR019', 1); 
arLoadData('Sobotta_RS17_DR020', 1); 
arLoadData('Sobotta_RS17_DR021', 1); 

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
arSave('Sobotta_RS17__Final', false, true); 


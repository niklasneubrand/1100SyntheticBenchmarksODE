% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS12 
% Random seed:		0001512000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS12'); 

% Load the time-course data 
arLoadData('Sobotta_RS12_TC001', 1); 
arLoadData('Sobotta_RS12_TC002', 1); 
arLoadData('Sobotta_RS12_TC003', 1); 
arLoadData('Sobotta_RS12_TC004', 1); 
arLoadData('Sobotta_RS12_TC005', 1); 
arLoadData('Sobotta_RS12_TC006', 1); 
arLoadData('Sobotta_RS12_TC007', 1); 
arLoadData('Sobotta_RS12_TC008', 1); 
arLoadData('Sobotta_RS12_TC009', 1); 
arLoadData('Sobotta_RS12_TC010', 1); 
arLoadData('Sobotta_RS12_TC011', 1); 
arLoadData('Sobotta_RS12_TC012', 1); 
arLoadData('Sobotta_RS12_TC013', 1); 
arLoadData('Sobotta_RS12_TC014', 1); 
arLoadData('Sobotta_RS12_TC015', 1); 
arLoadData('Sobotta_RS12_TC016', 1); 
arLoadData('Sobotta_RS12_TC017', 1); 
arLoadData('Sobotta_RS12_TC018', 1); 
arLoadData('Sobotta_RS12_TC019', 1); 
arLoadData('Sobotta_RS12_TC020', 1); 
arLoadData('Sobotta_RS12_TC021', 1); 
arLoadData('Sobotta_RS12_TC022', 1); 
arLoadData('Sobotta_RS12_TC023', 1); 
arLoadData('Sobotta_RS12_TC024', 1); 
arLoadData('Sobotta_RS12_TC025', 1); 
arLoadData('Sobotta_RS12_TC026', 1); 
arLoadData('Sobotta_RS12_TC027', 1); 
arLoadData('Sobotta_RS12_TC028', 1); 
arLoadData('Sobotta_RS12_TC029', 1); 
arLoadData('Sobotta_RS12_TC030', 1); 
arLoadData('Sobotta_RS12_TC031', 1); 
arLoadData('Sobotta_RS12_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS12_DR001', 1); 
arLoadData('Sobotta_RS12_DR002', 1); 
arLoadData('Sobotta_RS12_DR003', 1); 
arLoadData('Sobotta_RS12_DR004', 1); 
arLoadData('Sobotta_RS12_DR005', 1); 
arLoadData('Sobotta_RS12_DR006', 1); 
arLoadData('Sobotta_RS12_DR007', 1); 
arLoadData('Sobotta_RS12_DR008', 1); 
arLoadData('Sobotta_RS12_DR009', 1); 
arLoadData('Sobotta_RS12_DR010', 1); 
arLoadData('Sobotta_RS12_DR011', 1); 
arLoadData('Sobotta_RS12_DR012', 1); 
arLoadData('Sobotta_RS12_DR013', 1); 
arLoadData('Sobotta_RS12_DR014', 1); 
arLoadData('Sobotta_RS12_DR015', 1); 
arLoadData('Sobotta_RS12_DR016', 1); 
arLoadData('Sobotta_RS12_DR017', 1); 
arLoadData('Sobotta_RS12_DR018', 1); 
arLoadData('Sobotta_RS12_DR019', 1); 
arLoadData('Sobotta_RS12_DR020', 1); 
arLoadData('Sobotta_RS12_DR021', 1); 

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
arSave('Sobotta_RS12__Final', false, true); 


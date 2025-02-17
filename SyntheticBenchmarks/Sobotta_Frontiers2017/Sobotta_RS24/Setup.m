% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS24 
% Random seed:		0001524000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS24'); 

% Load the time-course data 
arLoadData('Sobotta_RS24_TC001', 1); 
arLoadData('Sobotta_RS24_TC002', 1); 
arLoadData('Sobotta_RS24_TC003', 1); 
arLoadData('Sobotta_RS24_TC004', 1); 
arLoadData('Sobotta_RS24_TC005', 1); 
arLoadData('Sobotta_RS24_TC006', 1); 
arLoadData('Sobotta_RS24_TC007', 1); 
arLoadData('Sobotta_RS24_TC008', 1); 
arLoadData('Sobotta_RS24_TC009', 1); 
arLoadData('Sobotta_RS24_TC010', 1); 
arLoadData('Sobotta_RS24_TC011', 1); 
arLoadData('Sobotta_RS24_TC012', 1); 
arLoadData('Sobotta_RS24_TC013', 1); 
arLoadData('Sobotta_RS24_TC014', 1); 
arLoadData('Sobotta_RS24_TC015', 1); 
arLoadData('Sobotta_RS24_TC016', 1); 
arLoadData('Sobotta_RS24_TC017', 1); 
arLoadData('Sobotta_RS24_TC018', 1); 
arLoadData('Sobotta_RS24_TC019', 1); 
arLoadData('Sobotta_RS24_TC020', 1); 
arLoadData('Sobotta_RS24_TC021', 1); 
arLoadData('Sobotta_RS24_TC022', 1); 
arLoadData('Sobotta_RS24_TC023', 1); 
arLoadData('Sobotta_RS24_TC024', 1); 
arLoadData('Sobotta_RS24_TC025', 1); 
arLoadData('Sobotta_RS24_TC026', 1); 
arLoadData('Sobotta_RS24_TC027', 1); 
arLoadData('Sobotta_RS24_TC028', 1); 
arLoadData('Sobotta_RS24_TC029', 1); 
arLoadData('Sobotta_RS24_TC030', 1); 
arLoadData('Sobotta_RS24_TC031', 1); 
arLoadData('Sobotta_RS24_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS24_DR001', 1); 
arLoadData('Sobotta_RS24_DR002', 1); 
arLoadData('Sobotta_RS24_DR003', 1); 
arLoadData('Sobotta_RS24_DR004', 1); 
arLoadData('Sobotta_RS24_DR005', 1); 
arLoadData('Sobotta_RS24_DR006', 1); 
arLoadData('Sobotta_RS24_DR007', 1); 
arLoadData('Sobotta_RS24_DR008', 1); 
arLoadData('Sobotta_RS24_DR009', 1); 
arLoadData('Sobotta_RS24_DR010', 1); 
arLoadData('Sobotta_RS24_DR011', 1); 
arLoadData('Sobotta_RS24_DR012', 1); 
arLoadData('Sobotta_RS24_DR013', 1); 
arLoadData('Sobotta_RS24_DR014', 1); 
arLoadData('Sobotta_RS24_DR015', 1); 
arLoadData('Sobotta_RS24_DR016', 1); 
arLoadData('Sobotta_RS24_DR017', 1); 
arLoadData('Sobotta_RS24_DR018', 1); 
arLoadData('Sobotta_RS24_DR019', 1); 
arLoadData('Sobotta_RS24_DR020', 1); 
arLoadData('Sobotta_RS24_DR021', 1); 

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
arSave('Sobotta_RS24__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS39 
% Random seed:		0001539000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS39'); 

% Load the time-course data 
arLoadData('Sobotta_RS39_TC001', 1); 
arLoadData('Sobotta_RS39_TC002', 1); 
arLoadData('Sobotta_RS39_TC003', 1); 
arLoadData('Sobotta_RS39_TC004', 1); 
arLoadData('Sobotta_RS39_TC005', 1); 
arLoadData('Sobotta_RS39_TC006', 1); 
arLoadData('Sobotta_RS39_TC007', 1); 
arLoadData('Sobotta_RS39_TC008', 1); 
arLoadData('Sobotta_RS39_TC009', 1); 
arLoadData('Sobotta_RS39_TC010', 1); 
arLoadData('Sobotta_RS39_TC011', 1); 
arLoadData('Sobotta_RS39_TC012', 1); 
arLoadData('Sobotta_RS39_TC013', 1); 
arLoadData('Sobotta_RS39_TC014', 1); 
arLoadData('Sobotta_RS39_TC015', 1); 
arLoadData('Sobotta_RS39_TC016', 1); 
arLoadData('Sobotta_RS39_TC017', 1); 
arLoadData('Sobotta_RS39_TC018', 1); 
arLoadData('Sobotta_RS39_TC019', 1); 
arLoadData('Sobotta_RS39_TC020', 1); 
arLoadData('Sobotta_RS39_TC021', 1); 
arLoadData('Sobotta_RS39_TC022', 1); 
arLoadData('Sobotta_RS39_TC023', 1); 
arLoadData('Sobotta_RS39_TC024', 1); 
arLoadData('Sobotta_RS39_TC025', 1); 
arLoadData('Sobotta_RS39_TC026', 1); 
arLoadData('Sobotta_RS39_TC027', 1); 
arLoadData('Sobotta_RS39_TC028', 1); 
arLoadData('Sobotta_RS39_TC029', 1); 
arLoadData('Sobotta_RS39_TC030', 1); 
arLoadData('Sobotta_RS39_TC031', 1); 
arLoadData('Sobotta_RS39_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS39_DR001', 1); 
arLoadData('Sobotta_RS39_DR002', 1); 
arLoadData('Sobotta_RS39_DR003', 1); 
arLoadData('Sobotta_RS39_DR004', 1); 
arLoadData('Sobotta_RS39_DR005', 1); 
arLoadData('Sobotta_RS39_DR006', 1); 
arLoadData('Sobotta_RS39_DR007', 1); 
arLoadData('Sobotta_RS39_DR008', 1); 
arLoadData('Sobotta_RS39_DR009', 1); 
arLoadData('Sobotta_RS39_DR010', 1); 
arLoadData('Sobotta_RS39_DR011', 1); 
arLoadData('Sobotta_RS39_DR012', 1); 
arLoadData('Sobotta_RS39_DR013', 1); 
arLoadData('Sobotta_RS39_DR014', 1); 
arLoadData('Sobotta_RS39_DR015', 1); 
arLoadData('Sobotta_RS39_DR016', 1); 
arLoadData('Sobotta_RS39_DR017', 1); 
arLoadData('Sobotta_RS39_DR018', 1); 
arLoadData('Sobotta_RS39_DR019', 1); 
arLoadData('Sobotta_RS39_DR020', 1); 
arLoadData('Sobotta_RS39_DR021', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 4000; 
ar.config.eq_tol = 1.000000e-10; 

% Pre-equilibration and Events 
arFindInputs(); 
arSteadyState(1, arFindCondition(ar, 'TC002'), 'all', {}, 1); 

% Save the project 
arSave('Sobotta_RS39__Final', false, true); 


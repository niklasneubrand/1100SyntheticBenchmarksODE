% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS04 
% Random seed:		0001504000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS04'); 

% Load the time-course data 
arLoadData('Sobotta_RS04_TC001', 1); 
arLoadData('Sobotta_RS04_TC002', 1); 
arLoadData('Sobotta_RS04_TC003', 1); 
arLoadData('Sobotta_RS04_TC004', 1); 
arLoadData('Sobotta_RS04_TC005', 1); 
arLoadData('Sobotta_RS04_TC006', 1); 
arLoadData('Sobotta_RS04_TC007', 1); 
arLoadData('Sobotta_RS04_TC008', 1); 
arLoadData('Sobotta_RS04_TC009', 1); 
arLoadData('Sobotta_RS04_TC010', 1); 
arLoadData('Sobotta_RS04_TC011', 1); 
arLoadData('Sobotta_RS04_TC012', 1); 
arLoadData('Sobotta_RS04_TC013', 1); 
arLoadData('Sobotta_RS04_TC014', 1); 
arLoadData('Sobotta_RS04_TC015', 1); 
arLoadData('Sobotta_RS04_TC016', 1); 
arLoadData('Sobotta_RS04_TC017', 1); 
arLoadData('Sobotta_RS04_TC018', 1); 
arLoadData('Sobotta_RS04_TC019', 1); 
arLoadData('Sobotta_RS04_TC020', 1); 
arLoadData('Sobotta_RS04_TC021', 1); 
arLoadData('Sobotta_RS04_TC022', 1); 
arLoadData('Sobotta_RS04_TC023', 1); 
arLoadData('Sobotta_RS04_TC024', 1); 
arLoadData('Sobotta_RS04_TC025', 1); 
arLoadData('Sobotta_RS04_TC026', 1); 
arLoadData('Sobotta_RS04_TC027', 1); 
arLoadData('Sobotta_RS04_TC028', 1); 
arLoadData('Sobotta_RS04_TC029', 1); 
arLoadData('Sobotta_RS04_TC030', 1); 
arLoadData('Sobotta_RS04_TC031', 1); 
arLoadData('Sobotta_RS04_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS04_DR001', 1); 
arLoadData('Sobotta_RS04_DR002', 1); 
arLoadData('Sobotta_RS04_DR003', 1); 
arLoadData('Sobotta_RS04_DR004', 1); 
arLoadData('Sobotta_RS04_DR005', 1); 
arLoadData('Sobotta_RS04_DR006', 1); 
arLoadData('Sobotta_RS04_DR007', 1); 
arLoadData('Sobotta_RS04_DR008', 1); 
arLoadData('Sobotta_RS04_DR009', 1); 
arLoadData('Sobotta_RS04_DR010', 1); 
arLoadData('Sobotta_RS04_DR011', 1); 
arLoadData('Sobotta_RS04_DR012', 1); 
arLoadData('Sobotta_RS04_DR013', 1); 
arLoadData('Sobotta_RS04_DR014', 1); 
arLoadData('Sobotta_RS04_DR015', 1); 
arLoadData('Sobotta_RS04_DR016', 1); 
arLoadData('Sobotta_RS04_DR017', 1); 
arLoadData('Sobotta_RS04_DR018', 1); 
arLoadData('Sobotta_RS04_DR019', 1); 
arLoadData('Sobotta_RS04_DR020', 1); 
arLoadData('Sobotta_RS04_DR021', 1); 

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
arSave('Sobotta_RS04__Final', false, true); 


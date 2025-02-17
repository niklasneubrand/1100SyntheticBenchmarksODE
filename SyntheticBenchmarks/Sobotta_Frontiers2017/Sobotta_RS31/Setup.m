% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS31 
% Random seed:		0001531000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS31'); 

% Load the time-course data 
arLoadData('Sobotta_RS31_TC001', 1); 
arLoadData('Sobotta_RS31_TC002', 1); 
arLoadData('Sobotta_RS31_TC003', 1); 
arLoadData('Sobotta_RS31_TC004', 1); 
arLoadData('Sobotta_RS31_TC005', 1); 
arLoadData('Sobotta_RS31_TC006', 1); 
arLoadData('Sobotta_RS31_TC007', 1); 
arLoadData('Sobotta_RS31_TC008', 1); 
arLoadData('Sobotta_RS31_TC009', 1); 
arLoadData('Sobotta_RS31_TC010', 1); 
arLoadData('Sobotta_RS31_TC011', 1); 
arLoadData('Sobotta_RS31_TC012', 1); 
arLoadData('Sobotta_RS31_TC013', 1); 
arLoadData('Sobotta_RS31_TC014', 1); 
arLoadData('Sobotta_RS31_TC015', 1); 
arLoadData('Sobotta_RS31_TC016', 1); 
arLoadData('Sobotta_RS31_TC017', 1); 
arLoadData('Sobotta_RS31_TC018', 1); 
arLoadData('Sobotta_RS31_TC019', 1); 
arLoadData('Sobotta_RS31_TC020', 1); 
arLoadData('Sobotta_RS31_TC021', 1); 
arLoadData('Sobotta_RS31_TC022', 1); 
arLoadData('Sobotta_RS31_TC023', 1); 
arLoadData('Sobotta_RS31_TC024', 1); 
arLoadData('Sobotta_RS31_TC025', 1); 
arLoadData('Sobotta_RS31_TC026', 1); 
arLoadData('Sobotta_RS31_TC027', 1); 
arLoadData('Sobotta_RS31_TC028', 1); 
arLoadData('Sobotta_RS31_TC029', 1); 
arLoadData('Sobotta_RS31_TC030', 1); 
arLoadData('Sobotta_RS31_TC031', 1); 
arLoadData('Sobotta_RS31_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS31_DR001', 1); 
arLoadData('Sobotta_RS31_DR002', 1); 
arLoadData('Sobotta_RS31_DR003', 1); 
arLoadData('Sobotta_RS31_DR004', 1); 
arLoadData('Sobotta_RS31_DR005', 1); 
arLoadData('Sobotta_RS31_DR006', 1); 
arLoadData('Sobotta_RS31_DR007', 1); 
arLoadData('Sobotta_RS31_DR008', 1); 
arLoadData('Sobotta_RS31_DR009', 1); 
arLoadData('Sobotta_RS31_DR010', 1); 
arLoadData('Sobotta_RS31_DR011', 1); 
arLoadData('Sobotta_RS31_DR012', 1); 
arLoadData('Sobotta_RS31_DR013', 1); 
arLoadData('Sobotta_RS31_DR014', 1); 
arLoadData('Sobotta_RS31_DR015', 1); 
arLoadData('Sobotta_RS31_DR016', 1); 
arLoadData('Sobotta_RS31_DR017', 1); 
arLoadData('Sobotta_RS31_DR018', 1); 
arLoadData('Sobotta_RS31_DR019', 1); 
arLoadData('Sobotta_RS31_DR020', 1); 
arLoadData('Sobotta_RS31_DR021', 1); 

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
arSave('Sobotta_RS31__Final', false, true); 


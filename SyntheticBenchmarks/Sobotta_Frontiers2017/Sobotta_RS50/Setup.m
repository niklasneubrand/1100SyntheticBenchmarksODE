% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS50 
% Random seed:		0001550010 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS50'); 

% Load the time-course data 
arLoadData('Sobotta_RS50_TC001', 1); 
arLoadData('Sobotta_RS50_TC002', 1); 
arLoadData('Sobotta_RS50_TC003', 1); 
arLoadData('Sobotta_RS50_TC004', 1); 
arLoadData('Sobotta_RS50_TC005', 1); 
arLoadData('Sobotta_RS50_TC006', 1); 
arLoadData('Sobotta_RS50_TC007', 1); 
arLoadData('Sobotta_RS50_TC008', 1); 
arLoadData('Sobotta_RS50_TC009', 1); 
arLoadData('Sobotta_RS50_TC010', 1); 
arLoadData('Sobotta_RS50_TC011', 1); 
arLoadData('Sobotta_RS50_TC012', 1); 
arLoadData('Sobotta_RS50_TC013', 1); 
arLoadData('Sobotta_RS50_TC014', 1); 
arLoadData('Sobotta_RS50_TC015', 1); 
arLoadData('Sobotta_RS50_TC016', 1); 
arLoadData('Sobotta_RS50_TC017', 1); 
arLoadData('Sobotta_RS50_TC018', 1); 
arLoadData('Sobotta_RS50_TC019', 1); 
arLoadData('Sobotta_RS50_TC020', 1); 
arLoadData('Sobotta_RS50_TC021', 1); 
arLoadData('Sobotta_RS50_TC022', 1); 
arLoadData('Sobotta_RS50_TC023', 1); 
arLoadData('Sobotta_RS50_TC024', 1); 
arLoadData('Sobotta_RS50_TC025', 1); 
arLoadData('Sobotta_RS50_TC026', 1); 
arLoadData('Sobotta_RS50_TC027', 1); 
arLoadData('Sobotta_RS50_TC028', 1); 
arLoadData('Sobotta_RS50_TC029', 1); 
arLoadData('Sobotta_RS50_TC030', 1); 
arLoadData('Sobotta_RS50_TC031', 1); 
arLoadData('Sobotta_RS50_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS50_DR001', 1); 
arLoadData('Sobotta_RS50_DR002', 1); 
arLoadData('Sobotta_RS50_DR003', 1); 
arLoadData('Sobotta_RS50_DR004', 1); 
arLoadData('Sobotta_RS50_DR005', 1); 
arLoadData('Sobotta_RS50_DR006', 1); 
arLoadData('Sobotta_RS50_DR007', 1); 
arLoadData('Sobotta_RS50_DR008', 1); 
arLoadData('Sobotta_RS50_DR009', 1); 
arLoadData('Sobotta_RS50_DR010', 1); 
arLoadData('Sobotta_RS50_DR011', 1); 
arLoadData('Sobotta_RS50_DR012', 1); 
arLoadData('Sobotta_RS50_DR013', 1); 
arLoadData('Sobotta_RS50_DR014', 1); 
arLoadData('Sobotta_RS50_DR015', 1); 
arLoadData('Sobotta_RS50_DR016', 1); 
arLoadData('Sobotta_RS50_DR017', 1); 
arLoadData('Sobotta_RS50_DR018', 1); 
arLoadData('Sobotta_RS50_DR019', 1); 
arLoadData('Sobotta_RS50_DR020', 1); 
arLoadData('Sobotta_RS50_DR021', 1); 

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
arSave('Sobotta_RS50__Final', false, true); 


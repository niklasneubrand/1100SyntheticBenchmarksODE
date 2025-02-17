% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS22 
% Random seed:		0001522000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS22'); 

% Load the time-course data 
arLoadData('Sobotta_RS22_TC001', 1); 
arLoadData('Sobotta_RS22_TC002', 1); 
arLoadData('Sobotta_RS22_TC003', 1); 
arLoadData('Sobotta_RS22_TC004', 1); 
arLoadData('Sobotta_RS22_TC005', 1); 
arLoadData('Sobotta_RS22_TC006', 1); 
arLoadData('Sobotta_RS22_TC007', 1); 
arLoadData('Sobotta_RS22_TC008', 1); 
arLoadData('Sobotta_RS22_TC009', 1); 
arLoadData('Sobotta_RS22_TC010', 1); 
arLoadData('Sobotta_RS22_TC011', 1); 
arLoadData('Sobotta_RS22_TC012', 1); 
arLoadData('Sobotta_RS22_TC013', 1); 
arLoadData('Sobotta_RS22_TC014', 1); 
arLoadData('Sobotta_RS22_TC015', 1); 
arLoadData('Sobotta_RS22_TC016', 1); 
arLoadData('Sobotta_RS22_TC017', 1); 
arLoadData('Sobotta_RS22_TC018', 1); 
arLoadData('Sobotta_RS22_TC019', 1); 
arLoadData('Sobotta_RS22_TC020', 1); 
arLoadData('Sobotta_RS22_TC021', 1); 
arLoadData('Sobotta_RS22_TC022', 1); 
arLoadData('Sobotta_RS22_TC023', 1); 
arLoadData('Sobotta_RS22_TC024', 1); 
arLoadData('Sobotta_RS22_TC025', 1); 
arLoadData('Sobotta_RS22_TC026', 1); 
arLoadData('Sobotta_RS22_TC027', 1); 
arLoadData('Sobotta_RS22_TC028', 1); 
arLoadData('Sobotta_RS22_TC029', 1); 
arLoadData('Sobotta_RS22_TC030', 1); 
arLoadData('Sobotta_RS22_TC031', 1); 
arLoadData('Sobotta_RS22_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS22_DR001', 1); 
arLoadData('Sobotta_RS22_DR002', 1); 
arLoadData('Sobotta_RS22_DR003', 1); 
arLoadData('Sobotta_RS22_DR004', 1); 
arLoadData('Sobotta_RS22_DR005', 1); 
arLoadData('Sobotta_RS22_DR006', 1); 
arLoadData('Sobotta_RS22_DR007', 1); 
arLoadData('Sobotta_RS22_DR008', 1); 
arLoadData('Sobotta_RS22_DR009', 1); 
arLoadData('Sobotta_RS22_DR010', 1); 
arLoadData('Sobotta_RS22_DR011', 1); 
arLoadData('Sobotta_RS22_DR012', 1); 
arLoadData('Sobotta_RS22_DR013', 1); 
arLoadData('Sobotta_RS22_DR014', 1); 
arLoadData('Sobotta_RS22_DR015', 1); 
arLoadData('Sobotta_RS22_DR016', 1); 
arLoadData('Sobotta_RS22_DR017', 1); 
arLoadData('Sobotta_RS22_DR018', 1); 
arLoadData('Sobotta_RS22_DR019', 1); 
arLoadData('Sobotta_RS22_DR020', 1); 
arLoadData('Sobotta_RS22_DR021', 1); 

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
arSave('Sobotta_RS22__Final', false, true); 


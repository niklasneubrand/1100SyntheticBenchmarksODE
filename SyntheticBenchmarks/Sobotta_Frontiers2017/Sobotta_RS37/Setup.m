% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS37 
% Random seed:		0001537000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS37'); 

% Load the time-course data 
arLoadData('Sobotta_RS37_TC001', 1); 
arLoadData('Sobotta_RS37_TC002', 1); 
arLoadData('Sobotta_RS37_TC003', 1); 
arLoadData('Sobotta_RS37_TC004', 1); 
arLoadData('Sobotta_RS37_TC005', 1); 
arLoadData('Sobotta_RS37_TC006', 1); 
arLoadData('Sobotta_RS37_TC007', 1); 
arLoadData('Sobotta_RS37_TC008', 1); 
arLoadData('Sobotta_RS37_TC009', 1); 
arLoadData('Sobotta_RS37_TC010', 1); 
arLoadData('Sobotta_RS37_TC011', 1); 
arLoadData('Sobotta_RS37_TC012', 1); 
arLoadData('Sobotta_RS37_TC013', 1); 
arLoadData('Sobotta_RS37_TC014', 1); 
arLoadData('Sobotta_RS37_TC015', 1); 
arLoadData('Sobotta_RS37_TC016', 1); 
arLoadData('Sobotta_RS37_TC017', 1); 
arLoadData('Sobotta_RS37_TC018', 1); 
arLoadData('Sobotta_RS37_TC019', 1); 
arLoadData('Sobotta_RS37_TC020', 1); 
arLoadData('Sobotta_RS37_TC021', 1); 
arLoadData('Sobotta_RS37_TC022', 1); 
arLoadData('Sobotta_RS37_TC023', 1); 
arLoadData('Sobotta_RS37_TC024', 1); 
arLoadData('Sobotta_RS37_TC025', 1); 
arLoadData('Sobotta_RS37_TC026', 1); 
arLoadData('Sobotta_RS37_TC027', 1); 
arLoadData('Sobotta_RS37_TC028', 1); 
arLoadData('Sobotta_RS37_TC029', 1); 
arLoadData('Sobotta_RS37_TC030', 1); 
arLoadData('Sobotta_RS37_TC031', 1); 
arLoadData('Sobotta_RS37_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS37_DR001', 1); 
arLoadData('Sobotta_RS37_DR002', 1); 
arLoadData('Sobotta_RS37_DR003', 1); 
arLoadData('Sobotta_RS37_DR004', 1); 
arLoadData('Sobotta_RS37_DR005', 1); 
arLoadData('Sobotta_RS37_DR006', 1); 
arLoadData('Sobotta_RS37_DR007', 1); 
arLoadData('Sobotta_RS37_DR008', 1); 
arLoadData('Sobotta_RS37_DR009', 1); 
arLoadData('Sobotta_RS37_DR010', 1); 
arLoadData('Sobotta_RS37_DR011', 1); 
arLoadData('Sobotta_RS37_DR012', 1); 
arLoadData('Sobotta_RS37_DR013', 1); 
arLoadData('Sobotta_RS37_DR014', 1); 
arLoadData('Sobotta_RS37_DR015', 1); 
arLoadData('Sobotta_RS37_DR016', 1); 
arLoadData('Sobotta_RS37_DR017', 1); 
arLoadData('Sobotta_RS37_DR018', 1); 
arLoadData('Sobotta_RS37_DR019', 1); 
arLoadData('Sobotta_RS37_DR020', 1); 
arLoadData('Sobotta_RS37_DR021', 1); 

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
arSave('Sobotta_RS37__Final', false, true); 


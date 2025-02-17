% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS06 
% Random seed:		0001506000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS06'); 

% Load the time-course data 
arLoadData('Sobotta_RS06_TC001', 1); 
arLoadData('Sobotta_RS06_TC002', 1); 
arLoadData('Sobotta_RS06_TC003', 1); 
arLoadData('Sobotta_RS06_TC004', 1); 
arLoadData('Sobotta_RS06_TC005', 1); 
arLoadData('Sobotta_RS06_TC006', 1); 
arLoadData('Sobotta_RS06_TC007', 1); 
arLoadData('Sobotta_RS06_TC008', 1); 
arLoadData('Sobotta_RS06_TC009', 1); 
arLoadData('Sobotta_RS06_TC010', 1); 
arLoadData('Sobotta_RS06_TC011', 1); 
arLoadData('Sobotta_RS06_TC012', 1); 
arLoadData('Sobotta_RS06_TC013', 1); 
arLoadData('Sobotta_RS06_TC014', 1); 
arLoadData('Sobotta_RS06_TC015', 1); 
arLoadData('Sobotta_RS06_TC016', 1); 
arLoadData('Sobotta_RS06_TC017', 1); 
arLoadData('Sobotta_RS06_TC018', 1); 
arLoadData('Sobotta_RS06_TC019', 1); 
arLoadData('Sobotta_RS06_TC020', 1); 
arLoadData('Sobotta_RS06_TC021', 1); 
arLoadData('Sobotta_RS06_TC022', 1); 
arLoadData('Sobotta_RS06_TC023', 1); 
arLoadData('Sobotta_RS06_TC024', 1); 
arLoadData('Sobotta_RS06_TC025', 1); 
arLoadData('Sobotta_RS06_TC026', 1); 
arLoadData('Sobotta_RS06_TC027', 1); 
arLoadData('Sobotta_RS06_TC028', 1); 
arLoadData('Sobotta_RS06_TC029', 1); 
arLoadData('Sobotta_RS06_TC030', 1); 
arLoadData('Sobotta_RS06_TC031', 1); 
arLoadData('Sobotta_RS06_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS06_DR001', 1); 
arLoadData('Sobotta_RS06_DR002', 1); 
arLoadData('Sobotta_RS06_DR003', 1); 
arLoadData('Sobotta_RS06_DR004', 1); 
arLoadData('Sobotta_RS06_DR005', 1); 
arLoadData('Sobotta_RS06_DR006', 1); 
arLoadData('Sobotta_RS06_DR007', 1); 
arLoadData('Sobotta_RS06_DR008', 1); 
arLoadData('Sobotta_RS06_DR009', 1); 
arLoadData('Sobotta_RS06_DR010', 1); 
arLoadData('Sobotta_RS06_DR011', 1); 
arLoadData('Sobotta_RS06_DR012', 1); 
arLoadData('Sobotta_RS06_DR013', 1); 
arLoadData('Sobotta_RS06_DR014', 1); 
arLoadData('Sobotta_RS06_DR015', 1); 
arLoadData('Sobotta_RS06_DR016', 1); 
arLoadData('Sobotta_RS06_DR017', 1); 
arLoadData('Sobotta_RS06_DR018', 1); 
arLoadData('Sobotta_RS06_DR019', 1); 
arLoadData('Sobotta_RS06_DR020', 1); 
arLoadData('Sobotta_RS06_DR021', 1); 

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
arSave('Sobotta_RS06__Final', false, true); 


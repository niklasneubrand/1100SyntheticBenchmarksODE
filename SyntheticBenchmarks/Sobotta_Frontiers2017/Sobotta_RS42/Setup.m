% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS42 
% Random seed:		0001542000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS42'); 

% Load the time-course data 
arLoadData('Sobotta_RS42_TC001', 1); 
arLoadData('Sobotta_RS42_TC002', 1); 
arLoadData('Sobotta_RS42_TC003', 1); 
arLoadData('Sobotta_RS42_TC004', 1); 
arLoadData('Sobotta_RS42_TC005', 1); 
arLoadData('Sobotta_RS42_TC006', 1); 
arLoadData('Sobotta_RS42_TC007', 1); 
arLoadData('Sobotta_RS42_TC008', 1); 
arLoadData('Sobotta_RS42_TC009', 1); 
arLoadData('Sobotta_RS42_TC010', 1); 
arLoadData('Sobotta_RS42_TC011', 1); 
arLoadData('Sobotta_RS42_TC012', 1); 
arLoadData('Sobotta_RS42_TC013', 1); 
arLoadData('Sobotta_RS42_TC014', 1); 
arLoadData('Sobotta_RS42_TC015', 1); 
arLoadData('Sobotta_RS42_TC016', 1); 
arLoadData('Sobotta_RS42_TC017', 1); 
arLoadData('Sobotta_RS42_TC018', 1); 
arLoadData('Sobotta_RS42_TC019', 1); 
arLoadData('Sobotta_RS42_TC020', 1); 
arLoadData('Sobotta_RS42_TC021', 1); 
arLoadData('Sobotta_RS42_TC022', 1); 
arLoadData('Sobotta_RS42_TC023', 1); 
arLoadData('Sobotta_RS42_TC024', 1); 
arLoadData('Sobotta_RS42_TC025', 1); 
arLoadData('Sobotta_RS42_TC026', 1); 
arLoadData('Sobotta_RS42_TC027', 1); 
arLoadData('Sobotta_RS42_TC028', 1); 
arLoadData('Sobotta_RS42_TC029', 1); 
arLoadData('Sobotta_RS42_TC030', 1); 
arLoadData('Sobotta_RS42_TC031', 1); 
arLoadData('Sobotta_RS42_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS42_DR001', 1); 
arLoadData('Sobotta_RS42_DR002', 1); 
arLoadData('Sobotta_RS42_DR003', 1); 
arLoadData('Sobotta_RS42_DR004', 1); 
arLoadData('Sobotta_RS42_DR005', 1); 
arLoadData('Sobotta_RS42_DR006', 1); 
arLoadData('Sobotta_RS42_DR007', 1); 
arLoadData('Sobotta_RS42_DR008', 1); 
arLoadData('Sobotta_RS42_DR009', 1); 
arLoadData('Sobotta_RS42_DR010', 1); 
arLoadData('Sobotta_RS42_DR011', 1); 
arLoadData('Sobotta_RS42_DR012', 1); 
arLoadData('Sobotta_RS42_DR013', 1); 
arLoadData('Sobotta_RS42_DR014', 1); 
arLoadData('Sobotta_RS42_DR015', 1); 
arLoadData('Sobotta_RS42_DR016', 1); 
arLoadData('Sobotta_RS42_DR017', 1); 
arLoadData('Sobotta_RS42_DR018', 1); 
arLoadData('Sobotta_RS42_DR019', 1); 
arLoadData('Sobotta_RS42_DR020', 1); 
arLoadData('Sobotta_RS42_DR021', 1); 

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
arSave('Sobotta_RS42__Final', false, true); 


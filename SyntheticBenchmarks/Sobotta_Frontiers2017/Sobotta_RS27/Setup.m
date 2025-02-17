% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS27 
% Random seed:		0001527000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS27'); 

% Load the time-course data 
arLoadData('Sobotta_RS27_TC001', 1); 
arLoadData('Sobotta_RS27_TC002', 1); 
arLoadData('Sobotta_RS27_TC003', 1); 
arLoadData('Sobotta_RS27_TC004', 1); 
arLoadData('Sobotta_RS27_TC005', 1); 
arLoadData('Sobotta_RS27_TC006', 1); 
arLoadData('Sobotta_RS27_TC007', 1); 
arLoadData('Sobotta_RS27_TC008', 1); 
arLoadData('Sobotta_RS27_TC009', 1); 
arLoadData('Sobotta_RS27_TC010', 1); 
arLoadData('Sobotta_RS27_TC011', 1); 
arLoadData('Sobotta_RS27_TC012', 1); 
arLoadData('Sobotta_RS27_TC013', 1); 
arLoadData('Sobotta_RS27_TC014', 1); 
arLoadData('Sobotta_RS27_TC015', 1); 
arLoadData('Sobotta_RS27_TC016', 1); 
arLoadData('Sobotta_RS27_TC017', 1); 
arLoadData('Sobotta_RS27_TC018', 1); 
arLoadData('Sobotta_RS27_TC019', 1); 
arLoadData('Sobotta_RS27_TC020', 1); 
arLoadData('Sobotta_RS27_TC021', 1); 
arLoadData('Sobotta_RS27_TC022', 1); 
arLoadData('Sobotta_RS27_TC023', 1); 
arLoadData('Sobotta_RS27_TC024', 1); 
arLoadData('Sobotta_RS27_TC025', 1); 
arLoadData('Sobotta_RS27_TC026', 1); 
arLoadData('Sobotta_RS27_TC027', 1); 
arLoadData('Sobotta_RS27_TC028', 1); 
arLoadData('Sobotta_RS27_TC029', 1); 
arLoadData('Sobotta_RS27_TC030', 1); 
arLoadData('Sobotta_RS27_TC031', 1); 
arLoadData('Sobotta_RS27_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS27_DR001', 1); 
arLoadData('Sobotta_RS27_DR002', 1); 
arLoadData('Sobotta_RS27_DR003', 1); 
arLoadData('Sobotta_RS27_DR004', 1); 
arLoadData('Sobotta_RS27_DR005', 1); 
arLoadData('Sobotta_RS27_DR006', 1); 
arLoadData('Sobotta_RS27_DR007', 1); 
arLoadData('Sobotta_RS27_DR008', 1); 
arLoadData('Sobotta_RS27_DR009', 1); 
arLoadData('Sobotta_RS27_DR010', 1); 
arLoadData('Sobotta_RS27_DR011', 1); 
arLoadData('Sobotta_RS27_DR012', 1); 
arLoadData('Sobotta_RS27_DR013', 1); 
arLoadData('Sobotta_RS27_DR014', 1); 
arLoadData('Sobotta_RS27_DR015', 1); 
arLoadData('Sobotta_RS27_DR016', 1); 
arLoadData('Sobotta_RS27_DR017', 1); 
arLoadData('Sobotta_RS27_DR018', 1); 
arLoadData('Sobotta_RS27_DR019', 1); 
arLoadData('Sobotta_RS27_DR020', 1); 
arLoadData('Sobotta_RS27_DR021', 1); 

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
arSave('Sobotta_RS27__Final', false, true); 


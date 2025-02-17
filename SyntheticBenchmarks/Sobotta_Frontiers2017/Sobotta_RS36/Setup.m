% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS36 
% Random seed:		0001536000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS36'); 

% Load the time-course data 
arLoadData('Sobotta_RS36_TC001', 1); 
arLoadData('Sobotta_RS36_TC002', 1); 
arLoadData('Sobotta_RS36_TC003', 1); 
arLoadData('Sobotta_RS36_TC004', 1); 
arLoadData('Sobotta_RS36_TC005', 1); 
arLoadData('Sobotta_RS36_TC006', 1); 
arLoadData('Sobotta_RS36_TC007', 1); 
arLoadData('Sobotta_RS36_TC008', 1); 
arLoadData('Sobotta_RS36_TC009', 1); 
arLoadData('Sobotta_RS36_TC010', 1); 
arLoadData('Sobotta_RS36_TC011', 1); 
arLoadData('Sobotta_RS36_TC012', 1); 
arLoadData('Sobotta_RS36_TC013', 1); 
arLoadData('Sobotta_RS36_TC014', 1); 
arLoadData('Sobotta_RS36_TC015', 1); 
arLoadData('Sobotta_RS36_TC016', 1); 
arLoadData('Sobotta_RS36_TC017', 1); 
arLoadData('Sobotta_RS36_TC018', 1); 
arLoadData('Sobotta_RS36_TC019', 1); 
arLoadData('Sobotta_RS36_TC020', 1); 
arLoadData('Sobotta_RS36_TC021', 1); 
arLoadData('Sobotta_RS36_TC022', 1); 
arLoadData('Sobotta_RS36_TC023', 1); 
arLoadData('Sobotta_RS36_TC024', 1); 
arLoadData('Sobotta_RS36_TC025', 1); 
arLoadData('Sobotta_RS36_TC026', 1); 
arLoadData('Sobotta_RS36_TC027', 1); 
arLoadData('Sobotta_RS36_TC028', 1); 
arLoadData('Sobotta_RS36_TC029', 1); 
arLoadData('Sobotta_RS36_TC030', 1); 
arLoadData('Sobotta_RS36_TC031', 1); 
arLoadData('Sobotta_RS36_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS36_DR001', 1); 
arLoadData('Sobotta_RS36_DR002', 1); 
arLoadData('Sobotta_RS36_DR003', 1); 
arLoadData('Sobotta_RS36_DR004', 1); 
arLoadData('Sobotta_RS36_DR005', 1); 
arLoadData('Sobotta_RS36_DR006', 1); 
arLoadData('Sobotta_RS36_DR007', 1); 
arLoadData('Sobotta_RS36_DR008', 1); 
arLoadData('Sobotta_RS36_DR009', 1); 
arLoadData('Sobotta_RS36_DR010', 1); 
arLoadData('Sobotta_RS36_DR011', 1); 
arLoadData('Sobotta_RS36_DR012', 1); 
arLoadData('Sobotta_RS36_DR013', 1); 
arLoadData('Sobotta_RS36_DR014', 1); 
arLoadData('Sobotta_RS36_DR015', 1); 
arLoadData('Sobotta_RS36_DR016', 1); 
arLoadData('Sobotta_RS36_DR017', 1); 
arLoadData('Sobotta_RS36_DR018', 1); 
arLoadData('Sobotta_RS36_DR019', 1); 
arLoadData('Sobotta_RS36_DR020', 1); 
arLoadData('Sobotta_RS36_DR021', 1); 

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
arSave('Sobotta_RS36__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS33 
% Random seed:		0001533000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS33'); 

% Load the time-course data 
arLoadData('Sobotta_RS33_TC001', 1); 
arLoadData('Sobotta_RS33_TC002', 1); 
arLoadData('Sobotta_RS33_TC003', 1); 
arLoadData('Sobotta_RS33_TC004', 1); 
arLoadData('Sobotta_RS33_TC005', 1); 
arLoadData('Sobotta_RS33_TC006', 1); 
arLoadData('Sobotta_RS33_TC007', 1); 
arLoadData('Sobotta_RS33_TC008', 1); 
arLoadData('Sobotta_RS33_TC009', 1); 
arLoadData('Sobotta_RS33_TC010', 1); 
arLoadData('Sobotta_RS33_TC011', 1); 
arLoadData('Sobotta_RS33_TC012', 1); 
arLoadData('Sobotta_RS33_TC013', 1); 
arLoadData('Sobotta_RS33_TC014', 1); 
arLoadData('Sobotta_RS33_TC015', 1); 
arLoadData('Sobotta_RS33_TC016', 1); 
arLoadData('Sobotta_RS33_TC017', 1); 
arLoadData('Sobotta_RS33_TC018', 1); 
arLoadData('Sobotta_RS33_TC019', 1); 
arLoadData('Sobotta_RS33_TC020', 1); 
arLoadData('Sobotta_RS33_TC021', 1); 
arLoadData('Sobotta_RS33_TC022', 1); 
arLoadData('Sobotta_RS33_TC023', 1); 
arLoadData('Sobotta_RS33_TC024', 1); 
arLoadData('Sobotta_RS33_TC025', 1); 
arLoadData('Sobotta_RS33_TC026', 1); 
arLoadData('Sobotta_RS33_TC027', 1); 
arLoadData('Sobotta_RS33_TC028', 1); 
arLoadData('Sobotta_RS33_TC029', 1); 
arLoadData('Sobotta_RS33_TC030', 1); 
arLoadData('Sobotta_RS33_TC031', 1); 
arLoadData('Sobotta_RS33_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS33_DR001', 1); 
arLoadData('Sobotta_RS33_DR002', 1); 
arLoadData('Sobotta_RS33_DR003', 1); 
arLoadData('Sobotta_RS33_DR004', 1); 
arLoadData('Sobotta_RS33_DR005', 1); 
arLoadData('Sobotta_RS33_DR006', 1); 
arLoadData('Sobotta_RS33_DR007', 1); 
arLoadData('Sobotta_RS33_DR008', 1); 
arLoadData('Sobotta_RS33_DR009', 1); 
arLoadData('Sobotta_RS33_DR010', 1); 
arLoadData('Sobotta_RS33_DR011', 1); 
arLoadData('Sobotta_RS33_DR012', 1); 
arLoadData('Sobotta_RS33_DR013', 1); 
arLoadData('Sobotta_RS33_DR014', 1); 
arLoadData('Sobotta_RS33_DR015', 1); 
arLoadData('Sobotta_RS33_DR016', 1); 
arLoadData('Sobotta_RS33_DR017', 1); 
arLoadData('Sobotta_RS33_DR018', 1); 
arLoadData('Sobotta_RS33_DR019', 1); 
arLoadData('Sobotta_RS33_DR020', 1); 
arLoadData('Sobotta_RS33_DR021', 1); 

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
arSave('Sobotta_RS33__Final', false, true); 


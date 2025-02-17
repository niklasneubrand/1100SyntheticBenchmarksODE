% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS11 
% Random seed:		0001511000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS11'); 

% Load the time-course data 
arLoadData('Sobotta_RS11_TC001', 1); 
arLoadData('Sobotta_RS11_TC002', 1); 
arLoadData('Sobotta_RS11_TC003', 1); 
arLoadData('Sobotta_RS11_TC004', 1); 
arLoadData('Sobotta_RS11_TC005', 1); 
arLoadData('Sobotta_RS11_TC006', 1); 
arLoadData('Sobotta_RS11_TC007', 1); 
arLoadData('Sobotta_RS11_TC008', 1); 
arLoadData('Sobotta_RS11_TC009', 1); 
arLoadData('Sobotta_RS11_TC010', 1); 
arLoadData('Sobotta_RS11_TC011', 1); 
arLoadData('Sobotta_RS11_TC012', 1); 
arLoadData('Sobotta_RS11_TC013', 1); 
arLoadData('Sobotta_RS11_TC014', 1); 
arLoadData('Sobotta_RS11_TC015', 1); 
arLoadData('Sobotta_RS11_TC016', 1); 
arLoadData('Sobotta_RS11_TC017', 1); 
arLoadData('Sobotta_RS11_TC018', 1); 
arLoadData('Sobotta_RS11_TC019', 1); 
arLoadData('Sobotta_RS11_TC020', 1); 
arLoadData('Sobotta_RS11_TC021', 1); 
arLoadData('Sobotta_RS11_TC022', 1); 
arLoadData('Sobotta_RS11_TC023', 1); 
arLoadData('Sobotta_RS11_TC024', 1); 
arLoadData('Sobotta_RS11_TC025', 1); 
arLoadData('Sobotta_RS11_TC026', 1); 
arLoadData('Sobotta_RS11_TC027', 1); 
arLoadData('Sobotta_RS11_TC028', 1); 
arLoadData('Sobotta_RS11_TC029', 1); 
arLoadData('Sobotta_RS11_TC030', 1); 
arLoadData('Sobotta_RS11_TC031', 1); 
arLoadData('Sobotta_RS11_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS11_DR001', 1); 
arLoadData('Sobotta_RS11_DR002', 1); 
arLoadData('Sobotta_RS11_DR003', 1); 
arLoadData('Sobotta_RS11_DR004', 1); 
arLoadData('Sobotta_RS11_DR005', 1); 
arLoadData('Sobotta_RS11_DR006', 1); 
arLoadData('Sobotta_RS11_DR007', 1); 
arLoadData('Sobotta_RS11_DR008', 1); 
arLoadData('Sobotta_RS11_DR009', 1); 
arLoadData('Sobotta_RS11_DR010', 1); 
arLoadData('Sobotta_RS11_DR011', 1); 
arLoadData('Sobotta_RS11_DR012', 1); 
arLoadData('Sobotta_RS11_DR013', 1); 
arLoadData('Sobotta_RS11_DR014', 1); 
arLoadData('Sobotta_RS11_DR015', 1); 
arLoadData('Sobotta_RS11_DR016', 1); 
arLoadData('Sobotta_RS11_DR017', 1); 
arLoadData('Sobotta_RS11_DR018', 1); 
arLoadData('Sobotta_RS11_DR019', 1); 
arLoadData('Sobotta_RS11_DR020', 1); 
arLoadData('Sobotta_RS11_DR021', 1); 

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
arSave('Sobotta_RS11__Final', false, true); 


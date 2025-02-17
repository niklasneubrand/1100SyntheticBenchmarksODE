% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS08 
% Random seed:		0001508000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS08'); 

% Load the time-course data 
arLoadData('Sobotta_RS08_TC001', 1); 
arLoadData('Sobotta_RS08_TC002', 1); 
arLoadData('Sobotta_RS08_TC003', 1); 
arLoadData('Sobotta_RS08_TC004', 1); 
arLoadData('Sobotta_RS08_TC005', 1); 
arLoadData('Sobotta_RS08_TC006', 1); 
arLoadData('Sobotta_RS08_TC007', 1); 
arLoadData('Sobotta_RS08_TC008', 1); 
arLoadData('Sobotta_RS08_TC009', 1); 
arLoadData('Sobotta_RS08_TC010', 1); 
arLoadData('Sobotta_RS08_TC011', 1); 
arLoadData('Sobotta_RS08_TC012', 1); 
arLoadData('Sobotta_RS08_TC013', 1); 
arLoadData('Sobotta_RS08_TC014', 1); 
arLoadData('Sobotta_RS08_TC015', 1); 
arLoadData('Sobotta_RS08_TC016', 1); 
arLoadData('Sobotta_RS08_TC017', 1); 
arLoadData('Sobotta_RS08_TC018', 1); 
arLoadData('Sobotta_RS08_TC019', 1); 
arLoadData('Sobotta_RS08_TC020', 1); 
arLoadData('Sobotta_RS08_TC021', 1); 
arLoadData('Sobotta_RS08_TC022', 1); 
arLoadData('Sobotta_RS08_TC023', 1); 
arLoadData('Sobotta_RS08_TC024', 1); 
arLoadData('Sobotta_RS08_TC025', 1); 
arLoadData('Sobotta_RS08_TC026', 1); 
arLoadData('Sobotta_RS08_TC027', 1); 
arLoadData('Sobotta_RS08_TC028', 1); 
arLoadData('Sobotta_RS08_TC029', 1); 
arLoadData('Sobotta_RS08_TC030', 1); 
arLoadData('Sobotta_RS08_TC031', 1); 
arLoadData('Sobotta_RS08_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS08_DR001', 1); 
arLoadData('Sobotta_RS08_DR002', 1); 
arLoadData('Sobotta_RS08_DR003', 1); 
arLoadData('Sobotta_RS08_DR004', 1); 
arLoadData('Sobotta_RS08_DR005', 1); 
arLoadData('Sobotta_RS08_DR006', 1); 
arLoadData('Sobotta_RS08_DR007', 1); 
arLoadData('Sobotta_RS08_DR008', 1); 
arLoadData('Sobotta_RS08_DR009', 1); 
arLoadData('Sobotta_RS08_DR010', 1); 
arLoadData('Sobotta_RS08_DR011', 1); 
arLoadData('Sobotta_RS08_DR012', 1); 
arLoadData('Sobotta_RS08_DR013', 1); 
arLoadData('Sobotta_RS08_DR014', 1); 
arLoadData('Sobotta_RS08_DR015', 1); 
arLoadData('Sobotta_RS08_DR016', 1); 
arLoadData('Sobotta_RS08_DR017', 1); 
arLoadData('Sobotta_RS08_DR018', 1); 
arLoadData('Sobotta_RS08_DR019', 1); 
arLoadData('Sobotta_RS08_DR020', 1); 
arLoadData('Sobotta_RS08_DR021', 1); 

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
arSave('Sobotta_RS08__Final', false, true); 


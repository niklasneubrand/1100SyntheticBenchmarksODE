% Setup File For Realistic Simulation
% Original project:	Sobotta_Frontiers2017 
% RS project name:	Sobotta_RS44 
% Random seed:		0001544000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sobotta_RS44'); 

% Load the time-course data 
arLoadData('Sobotta_RS44_TC001', 1); 
arLoadData('Sobotta_RS44_TC002', 1); 
arLoadData('Sobotta_RS44_TC003', 1); 
arLoadData('Sobotta_RS44_TC004', 1); 
arLoadData('Sobotta_RS44_TC005', 1); 
arLoadData('Sobotta_RS44_TC006', 1); 
arLoadData('Sobotta_RS44_TC007', 1); 
arLoadData('Sobotta_RS44_TC008', 1); 
arLoadData('Sobotta_RS44_TC009', 1); 
arLoadData('Sobotta_RS44_TC010', 1); 
arLoadData('Sobotta_RS44_TC011', 1); 
arLoadData('Sobotta_RS44_TC012', 1); 
arLoadData('Sobotta_RS44_TC013', 1); 
arLoadData('Sobotta_RS44_TC014', 1); 
arLoadData('Sobotta_RS44_TC015', 1); 
arLoadData('Sobotta_RS44_TC016', 1); 
arLoadData('Sobotta_RS44_TC017', 1); 
arLoadData('Sobotta_RS44_TC018', 1); 
arLoadData('Sobotta_RS44_TC019', 1); 
arLoadData('Sobotta_RS44_TC020', 1); 
arLoadData('Sobotta_RS44_TC021', 1); 
arLoadData('Sobotta_RS44_TC022', 1); 
arLoadData('Sobotta_RS44_TC023', 1); 
arLoadData('Sobotta_RS44_TC024', 1); 
arLoadData('Sobotta_RS44_TC025', 1); 
arLoadData('Sobotta_RS44_TC026', 1); 
arLoadData('Sobotta_RS44_TC027', 1); 
arLoadData('Sobotta_RS44_TC028', 1); 
arLoadData('Sobotta_RS44_TC029', 1); 
arLoadData('Sobotta_RS44_TC030', 1); 
arLoadData('Sobotta_RS44_TC031', 1); 
arLoadData('Sobotta_RS44_TC032', 1); 

% Load the dose-response data 
arLoadData('Sobotta_RS44_DR001', 1); 
arLoadData('Sobotta_RS44_DR002', 1); 
arLoadData('Sobotta_RS44_DR003', 1); 
arLoadData('Sobotta_RS44_DR004', 1); 
arLoadData('Sobotta_RS44_DR005', 1); 
arLoadData('Sobotta_RS44_DR006', 1); 
arLoadData('Sobotta_RS44_DR007', 1); 
arLoadData('Sobotta_RS44_DR008', 1); 
arLoadData('Sobotta_RS44_DR009', 1); 
arLoadData('Sobotta_RS44_DR010', 1); 
arLoadData('Sobotta_RS44_DR011', 1); 
arLoadData('Sobotta_RS44_DR012', 1); 
arLoadData('Sobotta_RS44_DR013', 1); 
arLoadData('Sobotta_RS44_DR014', 1); 
arLoadData('Sobotta_RS44_DR015', 1); 
arLoadData('Sobotta_RS44_DR016', 1); 
arLoadData('Sobotta_RS44_DR017', 1); 
arLoadData('Sobotta_RS44_DR018', 1); 
arLoadData('Sobotta_RS44_DR019', 1); 
arLoadData('Sobotta_RS44_DR020', 1); 
arLoadData('Sobotta_RS44_DR021', 1); 

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
arSave('Sobotta_RS44__Final', false, true); 


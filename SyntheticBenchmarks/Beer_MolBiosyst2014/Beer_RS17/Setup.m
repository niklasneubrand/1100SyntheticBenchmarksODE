% Setup File For Realistic Simulation
% Original project:	Beer_MolBiosyst2014 
% RS project name:	Beer_RS17 
% Random seed:		0000217000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Beer_RS17'); 

% Load the time-course data 
arLoadData('Beer_RS17_TC001', 1); 
arLoadData('Beer_RS17_TC002', 1); 
arLoadData('Beer_RS17_TC003', 1); 
arLoadData('Beer_RS17_TC004', 1); 
arLoadData('Beer_RS17_TC005', 1); 
arLoadData('Beer_RS17_TC006', 1); 
arLoadData('Beer_RS17_TC007', 1); 
arLoadData('Beer_RS17_TC008', 1); 
arLoadData('Beer_RS17_TC009', 1); 
arLoadData('Beer_RS17_TC010', 1); 
arLoadData('Beer_RS17_TC011', 1); 
arLoadData('Beer_RS17_TC012', 1); 
arLoadData('Beer_RS17_TC013', 1); 
arLoadData('Beer_RS17_TC014', 1); 
arLoadData('Beer_RS17_TC015', 1); 
arLoadData('Beer_RS17_TC016', 1); 
arLoadData('Beer_RS17_TC017', 1); 
arLoadData('Beer_RS17_TC018', 1); 
arLoadData('Beer_RS17_TC019', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Beer_RS17__Final', false, true); 


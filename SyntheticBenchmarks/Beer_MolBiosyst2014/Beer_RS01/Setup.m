% Setup File For Realistic Simulation
% Original project:	Beer_MolBiosyst2014 
% RS project name:	Beer_RS01 
% Random seed:		0000201000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Beer_RS01'); 

% Load the time-course data 
arLoadData('Beer_RS01_TC001', 1); 
arLoadData('Beer_RS01_TC002', 1); 
arLoadData('Beer_RS01_TC003', 1); 
arLoadData('Beer_RS01_TC004', 1); 
arLoadData('Beer_RS01_TC005', 1); 
arLoadData('Beer_RS01_TC006', 1); 
arLoadData('Beer_RS01_TC007', 1); 
arLoadData('Beer_RS01_TC008', 1); 
arLoadData('Beer_RS01_TC009', 1); 
arLoadData('Beer_RS01_TC010', 1); 
arLoadData('Beer_RS01_TC011', 1); 
arLoadData('Beer_RS01_TC012', 1); 
arLoadData('Beer_RS01_TC013', 1); 
arLoadData('Beer_RS01_TC014', 1); 
arLoadData('Beer_RS01_TC015', 1); 
arLoadData('Beer_RS01_TC016', 1); 
arLoadData('Beer_RS01_TC017', 1); 
arLoadData('Beer_RS01_TC018', 1); 
arLoadData('Beer_RS01_TC019', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Beer_RS01__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Beer_MolBiosyst2014 
% RS project name:	Beer_RS29 
% Random seed:		0000229000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Beer_RS29'); 

% Load the time-course data 
arLoadData('Beer_RS29_TC001', 1); 
arLoadData('Beer_RS29_TC002', 1); 
arLoadData('Beer_RS29_TC003', 1); 
arLoadData('Beer_RS29_TC004', 1); 
arLoadData('Beer_RS29_TC005', 1); 
arLoadData('Beer_RS29_TC006', 1); 
arLoadData('Beer_RS29_TC007', 1); 
arLoadData('Beer_RS29_TC008', 1); 
arLoadData('Beer_RS29_TC009', 1); 
arLoadData('Beer_RS29_TC010', 1); 
arLoadData('Beer_RS29_TC011', 1); 
arLoadData('Beer_RS29_TC012', 1); 
arLoadData('Beer_RS29_TC013', 1); 
arLoadData('Beer_RS29_TC014', 1); 
arLoadData('Beer_RS29_TC015', 1); 
arLoadData('Beer_RS29_TC016', 1); 
arLoadData('Beer_RS29_TC017', 1); 
arLoadData('Beer_RS29_TC018', 1); 
arLoadData('Beer_RS29_TC019', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Beer_RS29__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Beer_MolBiosyst2014 
% RS project name:	Beer_RS30 
% Random seed:		0000230000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Beer_RS30'); 

% Load the time-course data 
arLoadData('Beer_RS30_TC001', 1); 
arLoadData('Beer_RS30_TC002', 1); 
arLoadData('Beer_RS30_TC003', 1); 
arLoadData('Beer_RS30_TC004', 1); 
arLoadData('Beer_RS30_TC005', 1); 
arLoadData('Beer_RS30_TC006', 1); 
arLoadData('Beer_RS30_TC007', 1); 
arLoadData('Beer_RS30_TC008', 1); 
arLoadData('Beer_RS30_TC009', 1); 
arLoadData('Beer_RS30_TC010', 1); 
arLoadData('Beer_RS30_TC011', 1); 
arLoadData('Beer_RS30_TC012', 1); 
arLoadData('Beer_RS30_TC013', 1); 
arLoadData('Beer_RS30_TC014', 1); 
arLoadData('Beer_RS30_TC015', 1); 
arLoadData('Beer_RS30_TC016', 1); 
arLoadData('Beer_RS30_TC017', 1); 
arLoadData('Beer_RS30_TC018', 1); 
arLoadData('Beer_RS30_TC019', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Beer_RS30__Final', false, true); 


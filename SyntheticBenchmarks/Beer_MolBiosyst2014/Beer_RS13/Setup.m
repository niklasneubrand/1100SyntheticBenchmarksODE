% Setup File For Realistic Simulation
% Original project:	Beer_MolBiosyst2014 
% RS project name:	Beer_RS13 
% Random seed:		0000213000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Beer_RS13'); 

% Load the time-course data 
arLoadData('Beer_RS13_TC001', 1); 
arLoadData('Beer_RS13_TC002', 1); 
arLoadData('Beer_RS13_TC003', 1); 
arLoadData('Beer_RS13_TC004', 1); 
arLoadData('Beer_RS13_TC005', 1); 
arLoadData('Beer_RS13_TC006', 1); 
arLoadData('Beer_RS13_TC007', 1); 
arLoadData('Beer_RS13_TC008', 1); 
arLoadData('Beer_RS13_TC009', 1); 
arLoadData('Beer_RS13_TC010', 1); 
arLoadData('Beer_RS13_TC011', 1); 
arLoadData('Beer_RS13_TC012', 1); 
arLoadData('Beer_RS13_TC013', 1); 
arLoadData('Beer_RS13_TC014', 1); 
arLoadData('Beer_RS13_TC015', 1); 
arLoadData('Beer_RS13_TC016', 1); 
arLoadData('Beer_RS13_TC017', 1); 
arLoadData('Beer_RS13_TC018', 1); 
arLoadData('Beer_RS13_TC019', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Beer_RS13__Final', false, true); 


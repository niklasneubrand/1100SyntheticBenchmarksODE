% Setup File For Realistic Simulation
% Original project:	Beer_MolBiosyst2014 
% RS project name:	Beer_RS04 
% Random seed:		0000204000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Beer_RS04'); 

% Load the time-course data 
arLoadData('Beer_RS04_TC001', 1); 
arLoadData('Beer_RS04_TC002', 1); 
arLoadData('Beer_RS04_TC003', 1); 
arLoadData('Beer_RS04_TC004', 1); 
arLoadData('Beer_RS04_TC005', 1); 
arLoadData('Beer_RS04_TC006', 1); 
arLoadData('Beer_RS04_TC007', 1); 
arLoadData('Beer_RS04_TC008', 1); 
arLoadData('Beer_RS04_TC009', 1); 
arLoadData('Beer_RS04_TC010', 1); 
arLoadData('Beer_RS04_TC011', 1); 
arLoadData('Beer_RS04_TC012', 1); 
arLoadData('Beer_RS04_TC013', 1); 
arLoadData('Beer_RS04_TC014', 1); 
arLoadData('Beer_RS04_TC015', 1); 
arLoadData('Beer_RS04_TC016', 1); 
arLoadData('Beer_RS04_TC017', 1); 
arLoadData('Beer_RS04_TC018', 1); 
arLoadData('Beer_RS04_TC019', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Beer_RS04__Final', false, true); 


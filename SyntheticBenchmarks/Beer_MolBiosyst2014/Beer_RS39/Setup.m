% Setup File For Realistic Simulation
% Original project:	Beer_MolBiosyst2014 
% RS project name:	Beer_RS39 
% Random seed:		0000239000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Beer_RS39'); 

% Load the time-course data 
arLoadData('Beer_RS39_TC001', 1); 
arLoadData('Beer_RS39_TC002', 1); 
arLoadData('Beer_RS39_TC003', 1); 
arLoadData('Beer_RS39_TC004', 1); 
arLoadData('Beer_RS39_TC005', 1); 
arLoadData('Beer_RS39_TC006', 1); 
arLoadData('Beer_RS39_TC007', 1); 
arLoadData('Beer_RS39_TC008', 1); 
arLoadData('Beer_RS39_TC009', 1); 
arLoadData('Beer_RS39_TC010', 1); 
arLoadData('Beer_RS39_TC011', 1); 
arLoadData('Beer_RS39_TC012', 1); 
arLoadData('Beer_RS39_TC013', 1); 
arLoadData('Beer_RS39_TC014', 1); 
arLoadData('Beer_RS39_TC015', 1); 
arLoadData('Beer_RS39_TC016', 1); 
arLoadData('Beer_RS39_TC017', 1); 
arLoadData('Beer_RS39_TC018', 1); 
arLoadData('Beer_RS39_TC019', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.atol = 1.000000e-08; 
ar.config.rtol = 1.000000e-08; 
ar.config.maxsteps = 100000; 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Beer_RS39__Final', false, true); 


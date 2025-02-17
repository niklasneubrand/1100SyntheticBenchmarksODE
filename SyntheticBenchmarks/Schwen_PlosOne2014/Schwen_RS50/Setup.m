% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS50 
% Random seed:		0001350000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS50'); 

% Load the time-course data 
arLoadData('Schwen_RS50_TC001', 1); 
arLoadData('Schwen_RS50_TC002', 1); 
arLoadData('Schwen_RS50_TC003', 1); 
arLoadData('Schwen_RS50_TC004', 1); 
arLoadData('Schwen_RS50_TC005', 1); 
arLoadData('Schwen_RS50_TC006', 1); 
arLoadData('Schwen_RS50_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS50__Final', false, true); 


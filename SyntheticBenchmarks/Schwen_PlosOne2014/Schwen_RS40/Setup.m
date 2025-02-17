% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS40 
% Random seed:		0001340000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS40'); 

% Load the time-course data 
arLoadData('Schwen_RS40_TC001', 1); 
arLoadData('Schwen_RS40_TC002', 1); 
arLoadData('Schwen_RS40_TC003', 1); 
arLoadData('Schwen_RS40_TC004', 1); 
arLoadData('Schwen_RS40_TC005', 1); 
arLoadData('Schwen_RS40_TC006', 1); 
arLoadData('Schwen_RS40_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS40__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS03 
% Random seed:		0001303000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS03'); 

% Load the time-course data 
arLoadData('Schwen_RS03_TC001', 1); 
arLoadData('Schwen_RS03_TC002', 1); 
arLoadData('Schwen_RS03_TC003', 1); 
arLoadData('Schwen_RS03_TC004', 1); 
arLoadData('Schwen_RS03_TC005', 1); 
arLoadData('Schwen_RS03_TC006', 1); 
arLoadData('Schwen_RS03_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS03__Final', false, true); 


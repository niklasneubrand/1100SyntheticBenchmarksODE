% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS46 
% Random seed:		0001346000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS46'); 

% Load the time-course data 
arLoadData('Schwen_RS46_TC001', 1); 
arLoadData('Schwen_RS46_TC002', 1); 
arLoadData('Schwen_RS46_TC003', 1); 
arLoadData('Schwen_RS46_TC004', 1); 
arLoadData('Schwen_RS46_TC005', 1); 
arLoadData('Schwen_RS46_TC006', 1); 
arLoadData('Schwen_RS46_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS46__Final', false, true); 


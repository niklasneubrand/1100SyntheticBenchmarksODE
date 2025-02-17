% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS47 
% Random seed:		0001347000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS47'); 

% Load the time-course data 
arLoadData('Schwen_RS47_TC001', 1); 
arLoadData('Schwen_RS47_TC002', 1); 
arLoadData('Schwen_RS47_TC003', 1); 
arLoadData('Schwen_RS47_TC004', 1); 
arLoadData('Schwen_RS47_TC005', 1); 
arLoadData('Schwen_RS47_TC006', 1); 
arLoadData('Schwen_RS47_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS47__Final', false, true); 


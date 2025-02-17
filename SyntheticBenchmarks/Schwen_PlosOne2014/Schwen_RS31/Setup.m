% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS31 
% Random seed:		0001331000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS31'); 

% Load the time-course data 
arLoadData('Schwen_RS31_TC001', 1); 
arLoadData('Schwen_RS31_TC002', 1); 
arLoadData('Schwen_RS31_TC003', 1); 
arLoadData('Schwen_RS31_TC004', 1); 
arLoadData('Schwen_RS31_TC005', 1); 
arLoadData('Schwen_RS31_TC006', 1); 
arLoadData('Schwen_RS31_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS31__Final', false, true); 


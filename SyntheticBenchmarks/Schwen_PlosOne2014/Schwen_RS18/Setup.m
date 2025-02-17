% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS18 
% Random seed:		0001318000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS18'); 

% Load the time-course data 
arLoadData('Schwen_RS18_TC001', 1); 
arLoadData('Schwen_RS18_TC002', 1); 
arLoadData('Schwen_RS18_TC003', 1); 
arLoadData('Schwen_RS18_TC004', 1); 
arLoadData('Schwen_RS18_TC005', 1); 
arLoadData('Schwen_RS18_TC006', 1); 
arLoadData('Schwen_RS18_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS18__Final', false, true); 


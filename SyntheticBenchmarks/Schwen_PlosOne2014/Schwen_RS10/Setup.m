% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS10 
% Random seed:		0001310000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS10'); 

% Load the time-course data 
arLoadData('Schwen_RS10_TC001', 1); 
arLoadData('Schwen_RS10_TC002', 1); 
arLoadData('Schwen_RS10_TC003', 1); 
arLoadData('Schwen_RS10_TC004', 1); 
arLoadData('Schwen_RS10_TC005', 1); 
arLoadData('Schwen_RS10_TC006', 1); 
arLoadData('Schwen_RS10_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS10__Final', false, true); 


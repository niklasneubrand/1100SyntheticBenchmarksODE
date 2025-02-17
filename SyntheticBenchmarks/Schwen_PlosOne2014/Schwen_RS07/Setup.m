% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS07 
% Random seed:		0001307000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS07'); 

% Load the time-course data 
arLoadData('Schwen_RS07_TC001', 1); 
arLoadData('Schwen_RS07_TC002', 1); 
arLoadData('Schwen_RS07_TC003', 1); 
arLoadData('Schwen_RS07_TC004', 1); 
arLoadData('Schwen_RS07_TC005', 1); 
arLoadData('Schwen_RS07_TC006', 1); 
arLoadData('Schwen_RS07_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS07__Final', false, true); 


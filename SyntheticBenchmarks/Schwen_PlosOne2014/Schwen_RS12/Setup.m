% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS12 
% Random seed:		0001312000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS12'); 

% Load the time-course data 
arLoadData('Schwen_RS12_TC001', 1); 
arLoadData('Schwen_RS12_TC002', 1); 
arLoadData('Schwen_RS12_TC003', 1); 
arLoadData('Schwen_RS12_TC004', 1); 
arLoadData('Schwen_RS12_TC005', 1); 
arLoadData('Schwen_RS12_TC006', 1); 
arLoadData('Schwen_RS12_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS12__Final', false, true); 


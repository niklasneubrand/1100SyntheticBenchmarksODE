% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS15 
% Random seed:		0001315000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS15'); 

% Load the time-course data 
arLoadData('Schwen_RS15_TC001', 1); 
arLoadData('Schwen_RS15_TC002', 1); 
arLoadData('Schwen_RS15_TC003', 1); 
arLoadData('Schwen_RS15_TC004', 1); 
arLoadData('Schwen_RS15_TC005', 1); 
arLoadData('Schwen_RS15_TC006', 1); 
arLoadData('Schwen_RS15_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS15__Final', false, true); 


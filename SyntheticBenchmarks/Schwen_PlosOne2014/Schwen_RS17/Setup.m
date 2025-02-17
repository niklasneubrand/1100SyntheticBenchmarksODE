% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS17 
% Random seed:		0001317000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS17'); 

% Load the time-course data 
arLoadData('Schwen_RS17_TC001', 1); 
arLoadData('Schwen_RS17_TC002', 1); 
arLoadData('Schwen_RS17_TC003', 1); 
arLoadData('Schwen_RS17_TC004', 1); 
arLoadData('Schwen_RS17_TC005', 1); 
arLoadData('Schwen_RS17_TC006', 1); 
arLoadData('Schwen_RS17_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS17__Final', false, true); 


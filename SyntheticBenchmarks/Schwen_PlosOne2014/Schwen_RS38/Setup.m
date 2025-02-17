% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS38 
% Random seed:		0001338000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS38'); 

% Load the time-course data 
arLoadData('Schwen_RS38_TC001', 1); 
arLoadData('Schwen_RS38_TC002', 1); 
arLoadData('Schwen_RS38_TC003', 1); 
arLoadData('Schwen_RS38_TC004', 1); 
arLoadData('Schwen_RS38_TC005', 1); 
arLoadData('Schwen_RS38_TC006', 1); 
arLoadData('Schwen_RS38_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS38__Final', false, true); 


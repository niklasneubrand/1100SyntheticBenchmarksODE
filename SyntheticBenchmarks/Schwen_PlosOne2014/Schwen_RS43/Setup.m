% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS43 
% Random seed:		0001343000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS43'); 

% Load the time-course data 
arLoadData('Schwen_RS43_TC001', 1); 
arLoadData('Schwen_RS43_TC002', 1); 
arLoadData('Schwen_RS43_TC003', 1); 
arLoadData('Schwen_RS43_TC004', 1); 
arLoadData('Schwen_RS43_TC005', 1); 
arLoadData('Schwen_RS43_TC006', 1); 
arLoadData('Schwen_RS43_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS43__Final', false, true); 


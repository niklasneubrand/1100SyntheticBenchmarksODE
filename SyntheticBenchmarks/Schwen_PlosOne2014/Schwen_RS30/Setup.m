% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS30 
% Random seed:		0001330000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS30'); 

% Load the time-course data 
arLoadData('Schwen_RS30_TC001', 1); 
arLoadData('Schwen_RS30_TC002', 1); 
arLoadData('Schwen_RS30_TC003', 1); 
arLoadData('Schwen_RS30_TC004', 1); 
arLoadData('Schwen_RS30_TC005', 1); 
arLoadData('Schwen_RS30_TC006', 1); 
arLoadData('Schwen_RS30_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS30__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS01 
% Random seed:		0001301000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS01'); 

% Load the time-course data 
arLoadData('Schwen_RS01_TC001', 1); 
arLoadData('Schwen_RS01_TC002', 1); 
arLoadData('Schwen_RS01_TC003', 1); 
arLoadData('Schwen_RS01_TC004', 1); 
arLoadData('Schwen_RS01_TC005', 1); 
arLoadData('Schwen_RS01_TC006', 1); 
arLoadData('Schwen_RS01_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS01__Final', false, true); 


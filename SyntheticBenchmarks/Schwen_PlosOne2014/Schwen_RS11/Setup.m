% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS11 
% Random seed:		0001311000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS11'); 

% Load the time-course data 
arLoadData('Schwen_RS11_TC001', 1); 
arLoadData('Schwen_RS11_TC002', 1); 
arLoadData('Schwen_RS11_TC003', 1); 
arLoadData('Schwen_RS11_TC004', 1); 
arLoadData('Schwen_RS11_TC005', 1); 
arLoadData('Schwen_RS11_TC006', 1); 
arLoadData('Schwen_RS11_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS11__Final', false, true); 


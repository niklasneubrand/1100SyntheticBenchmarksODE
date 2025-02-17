% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS37 
% Random seed:		0001337000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS37'); 

% Load the time-course data 
arLoadData('Schwen_RS37_TC001', 1); 
arLoadData('Schwen_RS37_TC002', 1); 
arLoadData('Schwen_RS37_TC003', 1); 
arLoadData('Schwen_RS37_TC004', 1); 
arLoadData('Schwen_RS37_TC005', 1); 
arLoadData('Schwen_RS37_TC006', 1); 
arLoadData('Schwen_RS37_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS37__Final', false, true); 


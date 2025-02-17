% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS22 
% Random seed:		0001322000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS22'); 

% Load the time-course data 
arLoadData('Schwen_RS22_TC001', 1); 
arLoadData('Schwen_RS22_TC002', 1); 
arLoadData('Schwen_RS22_TC003', 1); 
arLoadData('Schwen_RS22_TC004', 1); 
arLoadData('Schwen_RS22_TC005', 1); 
arLoadData('Schwen_RS22_TC006', 1); 
arLoadData('Schwen_RS22_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS22__Final', false, true); 


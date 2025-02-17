% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS04 
% Random seed:		0001304000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS04'); 

% Load the time-course data 
arLoadData('Schwen_RS04_TC001', 1); 
arLoadData('Schwen_RS04_TC002', 1); 
arLoadData('Schwen_RS04_TC003', 1); 
arLoadData('Schwen_RS04_TC004', 1); 
arLoadData('Schwen_RS04_TC005', 1); 
arLoadData('Schwen_RS04_TC006', 1); 
arLoadData('Schwen_RS04_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS04__Final', false, true); 


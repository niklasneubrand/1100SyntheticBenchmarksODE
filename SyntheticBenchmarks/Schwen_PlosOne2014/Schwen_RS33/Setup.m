% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS33 
% Random seed:		0001333000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS33'); 

% Load the time-course data 
arLoadData('Schwen_RS33_TC001', 1); 
arLoadData('Schwen_RS33_TC002', 1); 
arLoadData('Schwen_RS33_TC003', 1); 
arLoadData('Schwen_RS33_TC004', 1); 
arLoadData('Schwen_RS33_TC005', 1); 
arLoadData('Schwen_RS33_TC006', 1); 
arLoadData('Schwen_RS33_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS33__Final', false, true); 


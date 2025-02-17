% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS24 
% Random seed:		0001324000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS24'); 

% Load the time-course data 
arLoadData('Schwen_RS24_TC001', 1); 
arLoadData('Schwen_RS24_TC002', 1); 
arLoadData('Schwen_RS24_TC003', 1); 
arLoadData('Schwen_RS24_TC004', 1); 
arLoadData('Schwen_RS24_TC005', 1); 
arLoadData('Schwen_RS24_TC006', 1); 
arLoadData('Schwen_RS24_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS24__Final', false, true); 


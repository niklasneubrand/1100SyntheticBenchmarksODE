% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS16 
% Random seed:		0001316000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS16'); 

% Load the time-course data 
arLoadData('Schwen_RS16_TC001', 1); 
arLoadData('Schwen_RS16_TC002', 1); 
arLoadData('Schwen_RS16_TC003', 1); 
arLoadData('Schwen_RS16_TC004', 1); 
arLoadData('Schwen_RS16_TC005', 1); 
arLoadData('Schwen_RS16_TC006', 1); 
arLoadData('Schwen_RS16_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS16__Final', false, true); 


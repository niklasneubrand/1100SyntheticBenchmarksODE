% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS48 
% Random seed:		0001348000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS48'); 

% Load the time-course data 
arLoadData('Schwen_RS48_TC001', 1); 
arLoadData('Schwen_RS48_TC002', 1); 
arLoadData('Schwen_RS48_TC003', 1); 
arLoadData('Schwen_RS48_TC004', 1); 
arLoadData('Schwen_RS48_TC005', 1); 
arLoadData('Schwen_RS48_TC006', 1); 
arLoadData('Schwen_RS48_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS48__Final', false, true); 


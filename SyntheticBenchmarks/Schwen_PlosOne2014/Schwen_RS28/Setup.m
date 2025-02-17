% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS28 
% Random seed:		0001328000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS28'); 

% Load the time-course data 
arLoadData('Schwen_RS28_TC001', 1); 
arLoadData('Schwen_RS28_TC002', 1); 
arLoadData('Schwen_RS28_TC003', 1); 
arLoadData('Schwen_RS28_TC004', 1); 
arLoadData('Schwen_RS28_TC005', 1); 
arLoadData('Schwen_RS28_TC006', 1); 
arLoadData('Schwen_RS28_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS28__Final', false, true); 


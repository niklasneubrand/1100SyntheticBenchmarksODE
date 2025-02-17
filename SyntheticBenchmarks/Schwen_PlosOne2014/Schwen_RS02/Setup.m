% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS02 
% Random seed:		0001302000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS02'); 

% Load the time-course data 
arLoadData('Schwen_RS02_TC001', 1); 
arLoadData('Schwen_RS02_TC002', 1); 
arLoadData('Schwen_RS02_TC003', 1); 
arLoadData('Schwen_RS02_TC004', 1); 
arLoadData('Schwen_RS02_TC005', 1); 
arLoadData('Schwen_RS02_TC006', 1); 
arLoadData('Schwen_RS02_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS02__Final', false, true); 


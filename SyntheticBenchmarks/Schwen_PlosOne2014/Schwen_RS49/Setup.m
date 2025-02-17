% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS49 
% Random seed:		0001349000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS49'); 

% Load the time-course data 
arLoadData('Schwen_RS49_TC001', 1); 
arLoadData('Schwen_RS49_TC002', 1); 
arLoadData('Schwen_RS49_TC003', 1); 
arLoadData('Schwen_RS49_TC004', 1); 
arLoadData('Schwen_RS49_TC005', 1); 
arLoadData('Schwen_RS49_TC006', 1); 
arLoadData('Schwen_RS49_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS49__Final', false, true); 


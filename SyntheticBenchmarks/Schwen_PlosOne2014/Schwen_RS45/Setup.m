% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS45 
% Random seed:		0001345000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS45'); 

% Load the time-course data 
arLoadData('Schwen_RS45_TC001', 1); 
arLoadData('Schwen_RS45_TC002', 1); 
arLoadData('Schwen_RS45_TC003', 1); 
arLoadData('Schwen_RS45_TC004', 1); 
arLoadData('Schwen_RS45_TC005', 1); 
arLoadData('Schwen_RS45_TC006', 1); 
arLoadData('Schwen_RS45_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS45__Final', false, true); 


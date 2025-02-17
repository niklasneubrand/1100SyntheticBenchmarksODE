% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS09 
% Random seed:		0001309000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS09'); 

% Load the time-course data 
arLoadData('Schwen_RS09_TC001', 1); 
arLoadData('Schwen_RS09_TC002', 1); 
arLoadData('Schwen_RS09_TC003', 1); 
arLoadData('Schwen_RS09_TC004', 1); 
arLoadData('Schwen_RS09_TC005', 1); 
arLoadData('Schwen_RS09_TC006', 1); 
arLoadData('Schwen_RS09_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS09__Final', false, true); 


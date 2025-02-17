% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS35 
% Random seed:		0001335000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS35'); 

% Load the time-course data 
arLoadData('Schwen_RS35_TC001', 1); 
arLoadData('Schwen_RS35_TC002', 1); 
arLoadData('Schwen_RS35_TC003', 1); 
arLoadData('Schwen_RS35_TC004', 1); 
arLoadData('Schwen_RS35_TC005', 1); 
arLoadData('Schwen_RS35_TC006', 1); 
arLoadData('Schwen_RS35_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS35__Final', false, true); 


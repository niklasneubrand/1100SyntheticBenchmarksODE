% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS14 
% Random seed:		0001314000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS14'); 

% Load the time-course data 
arLoadData('Schwen_RS14_TC001', 1); 
arLoadData('Schwen_RS14_TC002', 1); 
arLoadData('Schwen_RS14_TC003', 1); 
arLoadData('Schwen_RS14_TC004', 1); 
arLoadData('Schwen_RS14_TC005', 1); 
arLoadData('Schwen_RS14_TC006', 1); 
arLoadData('Schwen_RS14_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS14__Final', false, true); 


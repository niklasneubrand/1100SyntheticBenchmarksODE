% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS25 
% Random seed:		0001325000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS25'); 

% Load the time-course data 
arLoadData('Schwen_RS25_TC001', 1); 
arLoadData('Schwen_RS25_TC002', 1); 
arLoadData('Schwen_RS25_TC003', 1); 
arLoadData('Schwen_RS25_TC004', 1); 
arLoadData('Schwen_RS25_TC005', 1); 
arLoadData('Schwen_RS25_TC006', 1); 
arLoadData('Schwen_RS25_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS25__Final', false, true); 


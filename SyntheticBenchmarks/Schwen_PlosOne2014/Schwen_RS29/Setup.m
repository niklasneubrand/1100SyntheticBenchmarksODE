% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS29 
% Random seed:		0001329000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS29'); 

% Load the time-course data 
arLoadData('Schwen_RS29_TC001', 1); 
arLoadData('Schwen_RS29_TC002', 1); 
arLoadData('Schwen_RS29_TC003', 1); 
arLoadData('Schwen_RS29_TC004', 1); 
arLoadData('Schwen_RS29_TC005', 1); 
arLoadData('Schwen_RS29_TC006', 1); 
arLoadData('Schwen_RS29_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS29__Final', false, true); 


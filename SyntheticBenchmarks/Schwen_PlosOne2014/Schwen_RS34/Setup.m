% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS34 
% Random seed:		0001334000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS34'); 

% Load the time-course data 
arLoadData('Schwen_RS34_TC001', 1); 
arLoadData('Schwen_RS34_TC002', 1); 
arLoadData('Schwen_RS34_TC003', 1); 
arLoadData('Schwen_RS34_TC004', 1); 
arLoadData('Schwen_RS34_TC005', 1); 
arLoadData('Schwen_RS34_TC006', 1); 
arLoadData('Schwen_RS34_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS34__Final', false, true); 


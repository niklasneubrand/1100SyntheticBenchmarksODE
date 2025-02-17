% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS06 
% Random seed:		0001306000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS06'); 

% Load the time-course data 
arLoadData('Schwen_RS06_TC001', 1); 
arLoadData('Schwen_RS06_TC002', 1); 
arLoadData('Schwen_RS06_TC003', 1); 
arLoadData('Schwen_RS06_TC004', 1); 
arLoadData('Schwen_RS06_TC005', 1); 
arLoadData('Schwen_RS06_TC006', 1); 
arLoadData('Schwen_RS06_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS06__Final', false, true); 


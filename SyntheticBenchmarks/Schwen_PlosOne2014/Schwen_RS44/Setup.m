% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS44 
% Random seed:		0001344000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS44'); 

% Load the time-course data 
arLoadData('Schwen_RS44_TC001', 1); 
arLoadData('Schwen_RS44_TC002', 1); 
arLoadData('Schwen_RS44_TC003', 1); 
arLoadData('Schwen_RS44_TC004', 1); 
arLoadData('Schwen_RS44_TC005', 1); 
arLoadData('Schwen_RS44_TC006', 1); 
arLoadData('Schwen_RS44_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS44__Final', false, true); 


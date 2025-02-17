% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS08 
% Random seed:		0001308000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS08'); 

% Load the time-course data 
arLoadData('Schwen_RS08_TC001', 1); 
arLoadData('Schwen_RS08_TC002', 1); 
arLoadData('Schwen_RS08_TC003', 1); 
arLoadData('Schwen_RS08_TC004', 1); 
arLoadData('Schwen_RS08_TC005', 1); 
arLoadData('Schwen_RS08_TC006', 1); 
arLoadData('Schwen_RS08_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS08__Final', false, true); 


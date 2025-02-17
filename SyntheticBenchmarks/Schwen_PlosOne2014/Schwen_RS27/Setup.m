% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS27 
% Random seed:		0001327000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS27'); 

% Load the time-course data 
arLoadData('Schwen_RS27_TC001', 1); 
arLoadData('Schwen_RS27_TC002', 1); 
arLoadData('Schwen_RS27_TC003', 1); 
arLoadData('Schwen_RS27_TC004', 1); 
arLoadData('Schwen_RS27_TC005', 1); 
arLoadData('Schwen_RS27_TC006', 1); 
arLoadData('Schwen_RS27_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS27__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS12 
% Random seed:		0001412000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS12'); 

% Load the time-course data 
arLoadData('Sneyd_RS12_TC001', 1); 
arLoadData('Sneyd_RS12_TC002', 1); 
arLoadData('Sneyd_RS12_TC003', 1); 
arLoadData('Sneyd_RS12_TC004', 1); 
arLoadData('Sneyd_RS12_TC005', 1); 
arLoadData('Sneyd_RS12_TC006', 1); 
arLoadData('Sneyd_RS12_TC007', 1); 
arLoadData('Sneyd_RS12_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS12__Final', false, true); 


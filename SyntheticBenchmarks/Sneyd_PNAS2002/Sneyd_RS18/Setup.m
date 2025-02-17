% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS18 
% Random seed:		0001418000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS18'); 

% Load the time-course data 
arLoadData('Sneyd_RS18_TC001', 1); 
arLoadData('Sneyd_RS18_TC002', 1); 
arLoadData('Sneyd_RS18_TC003', 1); 
arLoadData('Sneyd_RS18_TC004', 1); 
arLoadData('Sneyd_RS18_TC005', 1); 
arLoadData('Sneyd_RS18_TC006', 1); 
arLoadData('Sneyd_RS18_TC007', 1); 
arLoadData('Sneyd_RS18_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS18__Final', false, true); 


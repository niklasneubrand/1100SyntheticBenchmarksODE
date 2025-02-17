% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS07 
% Random seed:		0001407000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS07'); 

% Load the time-course data 
arLoadData('Sneyd_RS07_TC001', 1); 
arLoadData('Sneyd_RS07_TC002', 1); 
arLoadData('Sneyd_RS07_TC003', 1); 
arLoadData('Sneyd_RS07_TC004', 1); 
arLoadData('Sneyd_RS07_TC005', 1); 
arLoadData('Sneyd_RS07_TC006', 1); 
arLoadData('Sneyd_RS07_TC007', 1); 
arLoadData('Sneyd_RS07_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS07__Final', false, true); 


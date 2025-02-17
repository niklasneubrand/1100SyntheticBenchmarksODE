% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS03 
% Random seed:		0001403000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS03'); 

% Load the time-course data 
arLoadData('Sneyd_RS03_TC001', 1); 
arLoadData('Sneyd_RS03_TC002', 1); 
arLoadData('Sneyd_RS03_TC003', 1); 
arLoadData('Sneyd_RS03_TC004', 1); 
arLoadData('Sneyd_RS03_TC005', 1); 
arLoadData('Sneyd_RS03_TC006', 1); 
arLoadData('Sneyd_RS03_TC007', 1); 
arLoadData('Sneyd_RS03_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS03__Final', false, true); 


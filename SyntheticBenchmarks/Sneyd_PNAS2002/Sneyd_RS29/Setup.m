% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS29 
% Random seed:		0001429000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS29'); 

% Load the time-course data 
arLoadData('Sneyd_RS29_TC001', 1); 
arLoadData('Sneyd_RS29_TC002', 1); 
arLoadData('Sneyd_RS29_TC003', 1); 
arLoadData('Sneyd_RS29_TC004', 1); 
arLoadData('Sneyd_RS29_TC005', 1); 
arLoadData('Sneyd_RS29_TC006', 1); 
arLoadData('Sneyd_RS29_TC007', 1); 
arLoadData('Sneyd_RS29_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS29__Final', false, true); 


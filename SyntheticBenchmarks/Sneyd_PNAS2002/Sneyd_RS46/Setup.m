% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS46 
% Random seed:		0001446000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS46'); 

% Load the time-course data 
arLoadData('Sneyd_RS46_TC001', 1); 
arLoadData('Sneyd_RS46_TC002', 1); 
arLoadData('Sneyd_RS46_TC003', 1); 
arLoadData('Sneyd_RS46_TC004', 1); 
arLoadData('Sneyd_RS46_TC005', 1); 
arLoadData('Sneyd_RS46_TC006', 1); 
arLoadData('Sneyd_RS46_TC007', 1); 
arLoadData('Sneyd_RS46_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS46__Final', false, true); 


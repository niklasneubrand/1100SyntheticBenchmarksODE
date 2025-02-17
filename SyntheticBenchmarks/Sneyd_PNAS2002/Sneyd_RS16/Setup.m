% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS16 
% Random seed:		0001416000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS16'); 

% Load the time-course data 
arLoadData('Sneyd_RS16_TC001', 1); 
arLoadData('Sneyd_RS16_TC002', 1); 
arLoadData('Sneyd_RS16_TC003', 1); 
arLoadData('Sneyd_RS16_TC004', 1); 
arLoadData('Sneyd_RS16_TC005', 1); 
arLoadData('Sneyd_RS16_TC006', 1); 
arLoadData('Sneyd_RS16_TC007', 1); 
arLoadData('Sneyd_RS16_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS16__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS23 
% Random seed:		0001423000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS23'); 

% Load the time-course data 
arLoadData('Sneyd_RS23_TC001', 1); 
arLoadData('Sneyd_RS23_TC002', 1); 
arLoadData('Sneyd_RS23_TC003', 1); 
arLoadData('Sneyd_RS23_TC004', 1); 
arLoadData('Sneyd_RS23_TC005', 1); 
arLoadData('Sneyd_RS23_TC006', 1); 
arLoadData('Sneyd_RS23_TC007', 1); 
arLoadData('Sneyd_RS23_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Custom settings 
ar.config.add_c = 60; 

% Save the project 
arSave('Sneyd_RS23__Final', false, true); 


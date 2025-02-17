% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS48 
% Random seed:		0001448000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS48'); 

% Load the time-course data 
arLoadData('Sneyd_RS48_TC001', 1); 
arLoadData('Sneyd_RS48_TC002', 1); 
arLoadData('Sneyd_RS48_TC003', 1); 
arLoadData('Sneyd_RS48_TC004', 1); 
arLoadData('Sneyd_RS48_TC005', 1); 
arLoadData('Sneyd_RS48_TC006', 1); 
arLoadData('Sneyd_RS48_TC007', 1); 
arLoadData('Sneyd_RS48_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS48__Final', false, true); 


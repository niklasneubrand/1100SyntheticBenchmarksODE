% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS10 
% Random seed:		0001410000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS10'); 

% Load the time-course data 
arLoadData('Sneyd_RS10_TC001', 1); 
arLoadData('Sneyd_RS10_TC002', 1); 
arLoadData('Sneyd_RS10_TC003', 1); 
arLoadData('Sneyd_RS10_TC004', 1); 
arLoadData('Sneyd_RS10_TC005', 1); 
arLoadData('Sneyd_RS10_TC006', 1); 
arLoadData('Sneyd_RS10_TC007', 1); 
arLoadData('Sneyd_RS10_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS10__Final', false, true); 


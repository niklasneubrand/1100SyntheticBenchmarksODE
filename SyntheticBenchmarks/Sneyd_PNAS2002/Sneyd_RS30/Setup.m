% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS30 
% Random seed:		0001430000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS30'); 

% Load the time-course data 
arLoadData('Sneyd_RS30_TC001', 1); 
arLoadData('Sneyd_RS30_TC002', 1); 
arLoadData('Sneyd_RS30_TC003', 1); 
arLoadData('Sneyd_RS30_TC004', 1); 
arLoadData('Sneyd_RS30_TC005', 1); 
arLoadData('Sneyd_RS30_TC006', 1); 
arLoadData('Sneyd_RS30_TC007', 1); 
arLoadData('Sneyd_RS30_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS30__Final', false, true); 


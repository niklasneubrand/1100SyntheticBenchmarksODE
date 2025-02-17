% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS05 
% Random seed:		0001405000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS05'); 

% Load the time-course data 
arLoadData('Sneyd_RS05_TC001', 1); 
arLoadData('Sneyd_RS05_TC002', 1); 
arLoadData('Sneyd_RS05_TC003', 1); 
arLoadData('Sneyd_RS05_TC004', 1); 
arLoadData('Sneyd_RS05_TC005', 1); 
arLoadData('Sneyd_RS05_TC006', 1); 
arLoadData('Sneyd_RS05_TC007', 1); 
arLoadData('Sneyd_RS05_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS05__Final', false, true); 


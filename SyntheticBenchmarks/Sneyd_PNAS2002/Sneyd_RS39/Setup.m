% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS39 
% Random seed:		0001439000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS39'); 

% Load the time-course data 
arLoadData('Sneyd_RS39_TC001', 1); 
arLoadData('Sneyd_RS39_TC002', 1); 
arLoadData('Sneyd_RS39_TC003', 1); 
arLoadData('Sneyd_RS39_TC004', 1); 
arLoadData('Sneyd_RS39_TC005', 1); 
arLoadData('Sneyd_RS39_TC006', 1); 
arLoadData('Sneyd_RS39_TC007', 1); 
arLoadData('Sneyd_RS39_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS39__Final', false, true); 


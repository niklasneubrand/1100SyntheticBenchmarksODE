% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS15 
% Random seed:		0001415000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS15'); 

% Load the time-course data 
arLoadData('Sneyd_RS15_TC001', 1); 
arLoadData('Sneyd_RS15_TC002', 1); 
arLoadData('Sneyd_RS15_TC003', 1); 
arLoadData('Sneyd_RS15_TC004', 1); 
arLoadData('Sneyd_RS15_TC005', 1); 
arLoadData('Sneyd_RS15_TC006', 1); 
arLoadData('Sneyd_RS15_TC007', 1); 
arLoadData('Sneyd_RS15_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS15__Final', false, true); 


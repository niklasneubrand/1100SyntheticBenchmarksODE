% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS24 
% Random seed:		0001424000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS24'); 

% Load the time-course data 
arLoadData('Sneyd_RS24_TC001', 1); 
arLoadData('Sneyd_RS24_TC002', 1); 
arLoadData('Sneyd_RS24_TC003', 1); 
arLoadData('Sneyd_RS24_TC004', 1); 
arLoadData('Sneyd_RS24_TC005', 1); 
arLoadData('Sneyd_RS24_TC006', 1); 
arLoadData('Sneyd_RS24_TC007', 1); 
arLoadData('Sneyd_RS24_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS24__Final', false, true); 


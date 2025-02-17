% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS04 
% Random seed:		0001404000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS04'); 

% Load the time-course data 
arLoadData('Sneyd_RS04_TC001', 1); 
arLoadData('Sneyd_RS04_TC002', 1); 
arLoadData('Sneyd_RS04_TC003', 1); 
arLoadData('Sneyd_RS04_TC004', 1); 
arLoadData('Sneyd_RS04_TC005', 1); 
arLoadData('Sneyd_RS04_TC006', 1); 
arLoadData('Sneyd_RS04_TC007', 1); 
arLoadData('Sneyd_RS04_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS04__Final', false, true); 


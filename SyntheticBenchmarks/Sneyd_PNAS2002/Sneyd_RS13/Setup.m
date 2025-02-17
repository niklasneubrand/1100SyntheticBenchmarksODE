% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS13 
% Random seed:		0001413000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS13'); 

% Load the time-course data 
arLoadData('Sneyd_RS13_TC001', 1); 
arLoadData('Sneyd_RS13_TC002', 1); 
arLoadData('Sneyd_RS13_TC003', 1); 
arLoadData('Sneyd_RS13_TC004', 1); 
arLoadData('Sneyd_RS13_TC005', 1); 
arLoadData('Sneyd_RS13_TC006', 1); 
arLoadData('Sneyd_RS13_TC007', 1); 
arLoadData('Sneyd_RS13_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS13__Final', false, true); 


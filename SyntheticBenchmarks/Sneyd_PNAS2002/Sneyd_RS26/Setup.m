% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS26 
% Random seed:		0001426000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS26'); 

% Load the time-course data 
arLoadData('Sneyd_RS26_TC001', 1); 
arLoadData('Sneyd_RS26_TC002', 1); 
arLoadData('Sneyd_RS26_TC003', 1); 
arLoadData('Sneyd_RS26_TC004', 1); 
arLoadData('Sneyd_RS26_TC005', 1); 
arLoadData('Sneyd_RS26_TC006', 1); 
arLoadData('Sneyd_RS26_TC007', 1); 
arLoadData('Sneyd_RS26_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS26__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS17 
% Random seed:		0001417000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS17'); 

% Load the time-course data 
arLoadData('Sneyd_RS17_TC001', 1); 
arLoadData('Sneyd_RS17_TC002', 1); 
arLoadData('Sneyd_RS17_TC003', 1); 
arLoadData('Sneyd_RS17_TC004', 1); 
arLoadData('Sneyd_RS17_TC005', 1); 
arLoadData('Sneyd_RS17_TC006', 1); 
arLoadData('Sneyd_RS17_TC007', 1); 
arLoadData('Sneyd_RS17_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS17__Final', false, true); 


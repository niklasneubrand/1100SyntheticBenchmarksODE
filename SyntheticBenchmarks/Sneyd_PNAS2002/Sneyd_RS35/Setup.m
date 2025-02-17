% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS35 
% Random seed:		0001435000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS35'); 

% Load the time-course data 
arLoadData('Sneyd_RS35_TC001', 1); 
arLoadData('Sneyd_RS35_TC002', 1); 
arLoadData('Sneyd_RS35_TC003', 1); 
arLoadData('Sneyd_RS35_TC004', 1); 
arLoadData('Sneyd_RS35_TC005', 1); 
arLoadData('Sneyd_RS35_TC006', 1); 
arLoadData('Sneyd_RS35_TC007', 1); 
arLoadData('Sneyd_RS35_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS35__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS11 
% Random seed:		0001411000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS11'); 

% Load the time-course data 
arLoadData('Sneyd_RS11_TC001', 1); 
arLoadData('Sneyd_RS11_TC002', 1); 
arLoadData('Sneyd_RS11_TC003', 1); 
arLoadData('Sneyd_RS11_TC004', 1); 
arLoadData('Sneyd_RS11_TC005', 1); 
arLoadData('Sneyd_RS11_TC006', 1); 
arLoadData('Sneyd_RS11_TC007', 1); 
arLoadData('Sneyd_RS11_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS11__Final', false, true); 


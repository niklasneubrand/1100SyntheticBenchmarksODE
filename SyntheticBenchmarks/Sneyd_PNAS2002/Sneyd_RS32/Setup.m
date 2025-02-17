% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS32 
% Random seed:		0001432000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS32'); 

% Load the time-course data 
arLoadData('Sneyd_RS32_TC001', 1); 
arLoadData('Sneyd_RS32_TC002', 1); 
arLoadData('Sneyd_RS32_TC003', 1); 
arLoadData('Sneyd_RS32_TC004', 1); 
arLoadData('Sneyd_RS32_TC005', 1); 
arLoadData('Sneyd_RS32_TC006', 1); 
arLoadData('Sneyd_RS32_TC007', 1); 
arLoadData('Sneyd_RS32_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS32__Final', false, true); 


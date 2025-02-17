% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS09 
% Random seed:		0001409000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS09'); 

% Load the time-course data 
arLoadData('Sneyd_RS09_TC001', 1); 
arLoadData('Sneyd_RS09_TC002', 1); 
arLoadData('Sneyd_RS09_TC003', 1); 
arLoadData('Sneyd_RS09_TC004', 1); 
arLoadData('Sneyd_RS09_TC005', 1); 
arLoadData('Sneyd_RS09_TC006', 1); 
arLoadData('Sneyd_RS09_TC007', 1); 
arLoadData('Sneyd_RS09_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS09__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS08 
% Random seed:		0001408000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS08'); 

% Load the time-course data 
arLoadData('Sneyd_RS08_TC001', 1); 
arLoadData('Sneyd_RS08_TC002', 1); 
arLoadData('Sneyd_RS08_TC003', 1); 
arLoadData('Sneyd_RS08_TC004', 1); 
arLoadData('Sneyd_RS08_TC005', 1); 
arLoadData('Sneyd_RS08_TC006', 1); 
arLoadData('Sneyd_RS08_TC007', 1); 
arLoadData('Sneyd_RS08_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS08__Final', false, true); 


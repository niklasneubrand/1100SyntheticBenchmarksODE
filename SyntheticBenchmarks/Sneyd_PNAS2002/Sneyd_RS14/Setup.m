% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS14 
% Random seed:		0001414000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS14'); 

% Load the time-course data 
arLoadData('Sneyd_RS14_TC001', 1); 
arLoadData('Sneyd_RS14_TC002', 1); 
arLoadData('Sneyd_RS14_TC003', 1); 
arLoadData('Sneyd_RS14_TC004', 1); 
arLoadData('Sneyd_RS14_TC005', 1); 
arLoadData('Sneyd_RS14_TC006', 1); 
arLoadData('Sneyd_RS14_TC007', 1); 
arLoadData('Sneyd_RS14_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS14__Final', false, true); 


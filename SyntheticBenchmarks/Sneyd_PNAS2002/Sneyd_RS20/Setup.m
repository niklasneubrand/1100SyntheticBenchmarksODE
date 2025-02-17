% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS20 
% Random seed:		0001420000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS20'); 

% Load the time-course data 
arLoadData('Sneyd_RS20_TC001', 1); 
arLoadData('Sneyd_RS20_TC002', 1); 
arLoadData('Sneyd_RS20_TC003', 1); 
arLoadData('Sneyd_RS20_TC004', 1); 
arLoadData('Sneyd_RS20_TC005', 1); 
arLoadData('Sneyd_RS20_TC006', 1); 
arLoadData('Sneyd_RS20_TC007', 1); 
arLoadData('Sneyd_RS20_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS20__Final', false, true); 


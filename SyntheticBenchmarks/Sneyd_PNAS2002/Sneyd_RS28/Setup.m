% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS28 
% Random seed:		0001428000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS28'); 

% Load the time-course data 
arLoadData('Sneyd_RS28_TC001', 1); 
arLoadData('Sneyd_RS28_TC002', 1); 
arLoadData('Sneyd_RS28_TC003', 1); 
arLoadData('Sneyd_RS28_TC004', 1); 
arLoadData('Sneyd_RS28_TC005', 1); 
arLoadData('Sneyd_RS28_TC006', 1); 
arLoadData('Sneyd_RS28_TC007', 1); 
arLoadData('Sneyd_RS28_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS28__Final', false, true); 


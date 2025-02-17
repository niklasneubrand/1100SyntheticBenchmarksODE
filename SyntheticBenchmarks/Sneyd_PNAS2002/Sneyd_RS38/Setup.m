% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS38 
% Random seed:		0001438000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS38'); 

% Load the time-course data 
arLoadData('Sneyd_RS38_TC001', 1); 
arLoadData('Sneyd_RS38_TC002', 1); 
arLoadData('Sneyd_RS38_TC003', 1); 
arLoadData('Sneyd_RS38_TC004', 1); 
arLoadData('Sneyd_RS38_TC005', 1); 
arLoadData('Sneyd_RS38_TC006', 1); 
arLoadData('Sneyd_RS38_TC007', 1); 
arLoadData('Sneyd_RS38_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS38__Final', false, true); 


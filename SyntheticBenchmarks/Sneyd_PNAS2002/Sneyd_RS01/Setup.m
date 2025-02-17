% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS01 
% Random seed:		0001401000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS01'); 

% Load the time-course data 
arLoadData('Sneyd_RS01_TC001', 1); 
arLoadData('Sneyd_RS01_TC002', 1); 
arLoadData('Sneyd_RS01_TC003', 1); 
arLoadData('Sneyd_RS01_TC004', 1); 
arLoadData('Sneyd_RS01_TC005', 1); 
arLoadData('Sneyd_RS01_TC006', 1); 
arLoadData('Sneyd_RS01_TC007', 1); 
arLoadData('Sneyd_RS01_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS01__Final', false, true); 


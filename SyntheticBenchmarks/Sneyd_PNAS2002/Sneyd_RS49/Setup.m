% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS49 
% Random seed:		0001449000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS49'); 

% Load the time-course data 
arLoadData('Sneyd_RS49_TC001', 1); 
arLoadData('Sneyd_RS49_TC002', 1); 
arLoadData('Sneyd_RS49_TC003', 1); 
arLoadData('Sneyd_RS49_TC004', 1); 
arLoadData('Sneyd_RS49_TC005', 1); 
arLoadData('Sneyd_RS49_TC006', 1); 
arLoadData('Sneyd_RS49_TC007', 1); 
arLoadData('Sneyd_RS49_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS49__Final', false, true); 


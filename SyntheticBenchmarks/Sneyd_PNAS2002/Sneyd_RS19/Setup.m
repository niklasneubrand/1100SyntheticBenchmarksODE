% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS19 
% Random seed:		0001419000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS19'); 

% Load the time-course data 
arLoadData('Sneyd_RS19_TC001', 1); 
arLoadData('Sneyd_RS19_TC002', 1); 
arLoadData('Sneyd_RS19_TC003', 1); 
arLoadData('Sneyd_RS19_TC004', 1); 
arLoadData('Sneyd_RS19_TC005', 1); 
arLoadData('Sneyd_RS19_TC006', 1); 
arLoadData('Sneyd_RS19_TC007', 1); 
arLoadData('Sneyd_RS19_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS19__Final', false, true); 


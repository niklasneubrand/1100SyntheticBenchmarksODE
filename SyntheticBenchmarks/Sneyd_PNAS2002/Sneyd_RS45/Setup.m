% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS45 
% Random seed:		0001445000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS45'); 

% Load the time-course data 
arLoadData('Sneyd_RS45_TC001', 1); 
arLoadData('Sneyd_RS45_TC002', 1); 
arLoadData('Sneyd_RS45_TC003', 1); 
arLoadData('Sneyd_RS45_TC004', 1); 
arLoadData('Sneyd_RS45_TC005', 1); 
arLoadData('Sneyd_RS45_TC006', 1); 
arLoadData('Sneyd_RS45_TC007', 1); 
arLoadData('Sneyd_RS45_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS45__Final', false, true); 


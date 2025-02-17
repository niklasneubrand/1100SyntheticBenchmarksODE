% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS47 
% Random seed:		0001447000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS47'); 

% Load the time-course data 
arLoadData('Sneyd_RS47_TC001', 1); 
arLoadData('Sneyd_RS47_TC002', 1); 
arLoadData('Sneyd_RS47_TC003', 1); 
arLoadData('Sneyd_RS47_TC004', 1); 
arLoadData('Sneyd_RS47_TC005', 1); 
arLoadData('Sneyd_RS47_TC006', 1); 
arLoadData('Sneyd_RS47_TC007', 1); 
arLoadData('Sneyd_RS47_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS47__Final', false, true); 


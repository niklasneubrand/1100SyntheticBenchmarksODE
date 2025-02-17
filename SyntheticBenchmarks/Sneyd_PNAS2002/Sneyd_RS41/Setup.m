% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS41 
% Random seed:		0001441000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS41'); 

% Load the time-course data 
arLoadData('Sneyd_RS41_TC001', 1); 
arLoadData('Sneyd_RS41_TC002', 1); 
arLoadData('Sneyd_RS41_TC003', 1); 
arLoadData('Sneyd_RS41_TC004', 1); 
arLoadData('Sneyd_RS41_TC005', 1); 
arLoadData('Sneyd_RS41_TC006', 1); 
arLoadData('Sneyd_RS41_TC007', 1); 
arLoadData('Sneyd_RS41_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS41__Final', false, true); 


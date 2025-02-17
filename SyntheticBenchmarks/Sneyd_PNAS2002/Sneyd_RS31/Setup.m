% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS31 
% Random seed:		0001431000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS31'); 

% Load the time-course data 
arLoadData('Sneyd_RS31_TC001', 1); 
arLoadData('Sneyd_RS31_TC002', 1); 
arLoadData('Sneyd_RS31_TC003', 1); 
arLoadData('Sneyd_RS31_TC004', 1); 
arLoadData('Sneyd_RS31_TC005', 1); 
arLoadData('Sneyd_RS31_TC006', 1); 
arLoadData('Sneyd_RS31_TC007', 1); 
arLoadData('Sneyd_RS31_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS31__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS06 
% Random seed:		0001406000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS06'); 

% Load the time-course data 
arLoadData('Sneyd_RS06_TC001', 1); 
arLoadData('Sneyd_RS06_TC002', 1); 
arLoadData('Sneyd_RS06_TC003', 1); 
arLoadData('Sneyd_RS06_TC004', 1); 
arLoadData('Sneyd_RS06_TC005', 1); 
arLoadData('Sneyd_RS06_TC006', 1); 
arLoadData('Sneyd_RS06_TC007', 1); 
arLoadData('Sneyd_RS06_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS06__Final', false, true); 


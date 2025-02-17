% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS37 
% Random seed:		0001437000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS37'); 

% Load the time-course data 
arLoadData('Sneyd_RS37_TC001', 1); 
arLoadData('Sneyd_RS37_TC002', 1); 
arLoadData('Sneyd_RS37_TC003', 1); 
arLoadData('Sneyd_RS37_TC004', 1); 
arLoadData('Sneyd_RS37_TC005', 1); 
arLoadData('Sneyd_RS37_TC006', 1); 
arLoadData('Sneyd_RS37_TC007', 1); 
arLoadData('Sneyd_RS37_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS37__Final', false, true); 


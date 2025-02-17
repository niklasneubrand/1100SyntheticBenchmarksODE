% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS36 
% Random seed:		0001436000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS36'); 

% Load the time-course data 
arLoadData('Sneyd_RS36_TC001', 1); 
arLoadData('Sneyd_RS36_TC002', 1); 
arLoadData('Sneyd_RS36_TC003', 1); 
arLoadData('Sneyd_RS36_TC004', 1); 
arLoadData('Sneyd_RS36_TC005', 1); 
arLoadData('Sneyd_RS36_TC006', 1); 
arLoadData('Sneyd_RS36_TC007', 1); 
arLoadData('Sneyd_RS36_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS36__Final', false, true); 


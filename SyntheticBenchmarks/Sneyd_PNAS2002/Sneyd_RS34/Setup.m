% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS34 
% Random seed:		0001434000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS34'); 

% Load the time-course data 
arLoadData('Sneyd_RS34_TC001', 1); 
arLoadData('Sneyd_RS34_TC002', 1); 
arLoadData('Sneyd_RS34_TC003', 1); 
arLoadData('Sneyd_RS34_TC004', 1); 
arLoadData('Sneyd_RS34_TC005', 1); 
arLoadData('Sneyd_RS34_TC006', 1); 
arLoadData('Sneyd_RS34_TC007', 1); 
arLoadData('Sneyd_RS34_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS34__Final', false, true); 


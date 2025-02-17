% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS22 
% Random seed:		0001422000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS22'); 

% Load the time-course data 
arLoadData('Sneyd_RS22_TC001', 1); 
arLoadData('Sneyd_RS22_TC002', 1); 
arLoadData('Sneyd_RS22_TC003', 1); 
arLoadData('Sneyd_RS22_TC004', 1); 
arLoadData('Sneyd_RS22_TC005', 1); 
arLoadData('Sneyd_RS22_TC006', 1); 
arLoadData('Sneyd_RS22_TC007', 1); 
arLoadData('Sneyd_RS22_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS22__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS21 
% Random seed:		0001421000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS21'); 

% Load the time-course data 
arLoadData('Sneyd_RS21_TC001', 1); 
arLoadData('Sneyd_RS21_TC002', 1); 
arLoadData('Sneyd_RS21_TC003', 1); 
arLoadData('Sneyd_RS21_TC004', 1); 
arLoadData('Sneyd_RS21_TC005', 1); 
arLoadData('Sneyd_RS21_TC006', 1); 
arLoadData('Sneyd_RS21_TC007', 1); 
arLoadData('Sneyd_RS21_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS21__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS25 
% Random seed:		0001425000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS25'); 

% Load the time-course data 
arLoadData('Sneyd_RS25_TC001', 1); 
arLoadData('Sneyd_RS25_TC002', 1); 
arLoadData('Sneyd_RS25_TC003', 1); 
arLoadData('Sneyd_RS25_TC004', 1); 
arLoadData('Sneyd_RS25_TC005', 1); 
arLoadData('Sneyd_RS25_TC006', 1); 
arLoadData('Sneyd_RS25_TC007', 1); 
arLoadData('Sneyd_RS25_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS25__Final', false, true); 


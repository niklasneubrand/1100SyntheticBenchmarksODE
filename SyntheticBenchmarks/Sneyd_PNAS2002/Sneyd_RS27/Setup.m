% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS27 
% Random seed:		0001427000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS27'); 

% Load the time-course data 
arLoadData('Sneyd_RS27_TC001', 1); 
arLoadData('Sneyd_RS27_TC002', 1); 
arLoadData('Sneyd_RS27_TC003', 1); 
arLoadData('Sneyd_RS27_TC004', 1); 
arLoadData('Sneyd_RS27_TC005', 1); 
arLoadData('Sneyd_RS27_TC006', 1); 
arLoadData('Sneyd_RS27_TC007', 1); 
arLoadData('Sneyd_RS27_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS27__Final', false, true); 


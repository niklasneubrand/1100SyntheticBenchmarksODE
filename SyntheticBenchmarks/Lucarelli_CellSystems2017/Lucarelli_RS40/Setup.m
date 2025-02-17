% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS40 
% Random seed:		0002140000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS40'); 

% Load the time-course data 
arLoadData('Lucarelli_RS40_TC001', 1); 
arLoadData('Lucarelli_RS40_TC002', 1); 
arLoadData('Lucarelli_RS40_TC003', 1); 
arLoadData('Lucarelli_RS40_TC004', 1); 
arLoadData('Lucarelli_RS40_TC005', 1); 
arLoadData('Lucarelli_RS40_TC006', 1); 
arLoadData('Lucarelli_RS40_TC007', 1); 
arLoadData('Lucarelli_RS40_TC008', 1); 
arLoadData('Lucarelli_RS40_TC009', 1); 
arLoadData('Lucarelli_RS40_TC010', 1); 
arLoadData('Lucarelli_RS40_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS40_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS40__Final', false, true); 


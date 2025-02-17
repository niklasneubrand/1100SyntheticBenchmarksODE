% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS18 
% Random seed:		0002118000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS18'); 

% Load the time-course data 
arLoadData('Lucarelli_RS18_TC001', 1); 
arLoadData('Lucarelli_RS18_TC002', 1); 
arLoadData('Lucarelli_RS18_TC003', 1); 
arLoadData('Lucarelli_RS18_TC004', 1); 
arLoadData('Lucarelli_RS18_TC005', 1); 
arLoadData('Lucarelli_RS18_TC006', 1); 
arLoadData('Lucarelli_RS18_TC007', 1); 
arLoadData('Lucarelli_RS18_TC008', 1); 
arLoadData('Lucarelli_RS18_TC009', 1); 
arLoadData('Lucarelli_RS18_TC010', 1); 
arLoadData('Lucarelli_RS18_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS18_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS18__Final', false, true); 


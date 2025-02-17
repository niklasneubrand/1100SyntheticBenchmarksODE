% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS32 
% Random seed:		0002132000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS32'); 

% Load the time-course data 
arLoadData('Lucarelli_RS32_TC001', 1); 
arLoadData('Lucarelli_RS32_TC002', 1); 
arLoadData('Lucarelli_RS32_TC003', 1); 
arLoadData('Lucarelli_RS32_TC004', 1); 
arLoadData('Lucarelli_RS32_TC005', 1); 
arLoadData('Lucarelli_RS32_TC006', 1); 
arLoadData('Lucarelli_RS32_TC007', 1); 
arLoadData('Lucarelli_RS32_TC008', 1); 
arLoadData('Lucarelli_RS32_TC009', 1); 
arLoadData('Lucarelli_RS32_TC010', 1); 
arLoadData('Lucarelli_RS32_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS32_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS32__Final', false, true); 


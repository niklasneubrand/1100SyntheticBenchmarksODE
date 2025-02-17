% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS23 
% Random seed:		0002123000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS23'); 

% Load the time-course data 
arLoadData('Lucarelli_RS23_TC001', 1); 
arLoadData('Lucarelli_RS23_TC002', 1); 
arLoadData('Lucarelli_RS23_TC003', 1); 
arLoadData('Lucarelli_RS23_TC004', 1); 
arLoadData('Lucarelli_RS23_TC005', 1); 
arLoadData('Lucarelli_RS23_TC006', 1); 
arLoadData('Lucarelli_RS23_TC007', 1); 
arLoadData('Lucarelli_RS23_TC008', 1); 
arLoadData('Lucarelli_RS23_TC009', 1); 
arLoadData('Lucarelli_RS23_TC010', 1); 
arLoadData('Lucarelli_RS23_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS23_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS23__Final', false, true); 


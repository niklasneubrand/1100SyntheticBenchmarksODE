% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS38 
% Random seed:		0002138000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS38'); 

% Load the time-course data 
arLoadData('Lucarelli_RS38_TC001', 1); 
arLoadData('Lucarelli_RS38_TC002', 1); 
arLoadData('Lucarelli_RS38_TC003', 1); 
arLoadData('Lucarelli_RS38_TC004', 1); 
arLoadData('Lucarelli_RS38_TC005', 1); 
arLoadData('Lucarelli_RS38_TC006', 1); 
arLoadData('Lucarelli_RS38_TC007', 1); 
arLoadData('Lucarelli_RS38_TC008', 1); 
arLoadData('Lucarelli_RS38_TC009', 1); 
arLoadData('Lucarelli_RS38_TC010', 1); 
arLoadData('Lucarelli_RS38_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS38_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS38__Final', false, true); 


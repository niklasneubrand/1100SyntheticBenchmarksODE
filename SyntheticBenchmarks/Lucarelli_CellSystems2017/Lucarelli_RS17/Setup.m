% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS17 
% Random seed:		0002117000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS17'); 

% Load the time-course data 
arLoadData('Lucarelli_RS17_TC001', 1); 
arLoadData('Lucarelli_RS17_TC002', 1); 
arLoadData('Lucarelli_RS17_TC003', 1); 
arLoadData('Lucarelli_RS17_TC004', 1); 
arLoadData('Lucarelli_RS17_TC005', 1); 
arLoadData('Lucarelli_RS17_TC006', 1); 
arLoadData('Lucarelli_RS17_TC007', 1); 
arLoadData('Lucarelli_RS17_TC008', 1); 
arLoadData('Lucarelli_RS17_TC009', 1); 
arLoadData('Lucarelli_RS17_TC010', 1); 
arLoadData('Lucarelli_RS17_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS17_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS17__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS15 
% Random seed:		0002115000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS15'); 

% Load the time-course data 
arLoadData('Lucarelli_RS15_TC001', 1); 
arLoadData('Lucarelli_RS15_TC002', 1); 
arLoadData('Lucarelli_RS15_TC003', 1); 
arLoadData('Lucarelli_RS15_TC004', 1); 
arLoadData('Lucarelli_RS15_TC005', 1); 
arLoadData('Lucarelli_RS15_TC006', 1); 
arLoadData('Lucarelli_RS15_TC007', 1); 
arLoadData('Lucarelli_RS15_TC008', 1); 
arLoadData('Lucarelli_RS15_TC009', 1); 
arLoadData('Lucarelli_RS15_TC010', 1); 
arLoadData('Lucarelli_RS15_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS15_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS15__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS13 
% Random seed:		0002113000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS13'); 

% Load the time-course data 
arLoadData('Lucarelli_RS13_TC001', 1); 
arLoadData('Lucarelli_RS13_TC002', 1); 
arLoadData('Lucarelli_RS13_TC003', 1); 
arLoadData('Lucarelli_RS13_TC004', 1); 
arLoadData('Lucarelli_RS13_TC005', 1); 
arLoadData('Lucarelli_RS13_TC006', 1); 
arLoadData('Lucarelli_RS13_TC007', 1); 
arLoadData('Lucarelli_RS13_TC008', 1); 
arLoadData('Lucarelli_RS13_TC009', 1); 
arLoadData('Lucarelli_RS13_TC010', 1); 
arLoadData('Lucarelli_RS13_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS13_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS13__Final', false, true); 


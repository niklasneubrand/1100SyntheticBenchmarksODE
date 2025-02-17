% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS39 
% Random seed:		0002139000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS39'); 

% Load the time-course data 
arLoadData('Lucarelli_RS39_TC001', 1); 
arLoadData('Lucarelli_RS39_TC002', 1); 
arLoadData('Lucarelli_RS39_TC003', 1); 
arLoadData('Lucarelli_RS39_TC004', 1); 
arLoadData('Lucarelli_RS39_TC005', 1); 
arLoadData('Lucarelli_RS39_TC006', 1); 
arLoadData('Lucarelli_RS39_TC007', 1); 
arLoadData('Lucarelli_RS39_TC008', 1); 
arLoadData('Lucarelli_RS39_TC009', 1); 
arLoadData('Lucarelli_RS39_TC010', 1); 
arLoadData('Lucarelli_RS39_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS39_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS39__Final', false, true); 


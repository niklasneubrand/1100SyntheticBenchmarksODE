% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS04 
% Random seed:		0002104000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS04'); 

% Load the time-course data 
arLoadData('Lucarelli_RS04_TC001', 1); 
arLoadData('Lucarelli_RS04_TC002', 1); 
arLoadData('Lucarelli_RS04_TC003', 1); 
arLoadData('Lucarelli_RS04_TC004', 1); 
arLoadData('Lucarelli_RS04_TC005', 1); 
arLoadData('Lucarelli_RS04_TC006', 1); 
arLoadData('Lucarelli_RS04_TC007', 1); 
arLoadData('Lucarelli_RS04_TC008', 1); 
arLoadData('Lucarelli_RS04_TC009', 1); 
arLoadData('Lucarelli_RS04_TC010', 1); 
arLoadData('Lucarelli_RS04_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS04_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS04__Final', false, true); 


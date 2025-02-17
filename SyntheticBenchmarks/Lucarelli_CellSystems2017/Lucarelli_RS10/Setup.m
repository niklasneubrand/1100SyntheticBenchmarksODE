% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS10 
% Random seed:		0002110000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS10'); 

% Load the time-course data 
arLoadData('Lucarelli_RS10_TC001', 1); 
arLoadData('Lucarelli_RS10_TC002', 1); 
arLoadData('Lucarelli_RS10_TC003', 1); 
arLoadData('Lucarelli_RS10_TC004', 1); 
arLoadData('Lucarelli_RS10_TC005', 1); 
arLoadData('Lucarelli_RS10_TC006', 1); 
arLoadData('Lucarelli_RS10_TC007', 1); 
arLoadData('Lucarelli_RS10_TC008', 1); 
arLoadData('Lucarelli_RS10_TC009', 1); 
arLoadData('Lucarelli_RS10_TC010', 1); 
arLoadData('Lucarelli_RS10_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS10_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS10__Final', false, true); 


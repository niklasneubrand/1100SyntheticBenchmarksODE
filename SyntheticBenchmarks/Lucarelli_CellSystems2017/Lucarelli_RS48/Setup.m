% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS48 
% Random seed:		0002148000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS48'); 

% Load the time-course data 
arLoadData('Lucarelli_RS48_TC001', 1); 
arLoadData('Lucarelli_RS48_TC002', 1); 
arLoadData('Lucarelli_RS48_TC003', 1); 
arLoadData('Lucarelli_RS48_TC004', 1); 
arLoadData('Lucarelli_RS48_TC005', 1); 
arLoadData('Lucarelli_RS48_TC006', 1); 
arLoadData('Lucarelli_RS48_TC007', 1); 
arLoadData('Lucarelli_RS48_TC008', 1); 
arLoadData('Lucarelli_RS48_TC009', 1); 
arLoadData('Lucarelli_RS48_TC010', 1); 
arLoadData('Lucarelli_RS48_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS48_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS48__Final', false, true); 


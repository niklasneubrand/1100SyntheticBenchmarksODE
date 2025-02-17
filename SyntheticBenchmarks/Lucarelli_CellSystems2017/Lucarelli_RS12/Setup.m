% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS12 
% Random seed:		0002112000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS12'); 

% Load the time-course data 
arLoadData('Lucarelli_RS12_TC001', 1); 
arLoadData('Lucarelli_RS12_TC002', 1); 
arLoadData('Lucarelli_RS12_TC003', 1); 
arLoadData('Lucarelli_RS12_TC004', 1); 
arLoadData('Lucarelli_RS12_TC005', 1); 
arLoadData('Lucarelli_RS12_TC006', 1); 
arLoadData('Lucarelli_RS12_TC007', 1); 
arLoadData('Lucarelli_RS12_TC008', 1); 
arLoadData('Lucarelli_RS12_TC009', 1); 
arLoadData('Lucarelli_RS12_TC010', 1); 
arLoadData('Lucarelli_RS12_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS12_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS12__Final', false, true); 


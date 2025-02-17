% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS05 
% Random seed:		0002105000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS05'); 

% Load the time-course data 
arLoadData('Lucarelli_RS05_TC001', 1); 
arLoadData('Lucarelli_RS05_TC002', 1); 
arLoadData('Lucarelli_RS05_TC003', 1); 
arLoadData('Lucarelli_RS05_TC004', 1); 
arLoadData('Lucarelli_RS05_TC005', 1); 
arLoadData('Lucarelli_RS05_TC006', 1); 
arLoadData('Lucarelli_RS05_TC007', 1); 
arLoadData('Lucarelli_RS05_TC008', 1); 
arLoadData('Lucarelli_RS05_TC009', 1); 
arLoadData('Lucarelli_RS05_TC010', 1); 
arLoadData('Lucarelli_RS05_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS05_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS05__Final', false, true); 


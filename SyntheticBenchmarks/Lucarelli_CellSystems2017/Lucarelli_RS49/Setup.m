% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS49 
% Random seed:		0002149000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS49'); 

% Load the time-course data 
arLoadData('Lucarelli_RS49_TC001', 1); 
arLoadData('Lucarelli_RS49_TC002', 1); 
arLoadData('Lucarelli_RS49_TC003', 1); 
arLoadData('Lucarelli_RS49_TC004', 1); 
arLoadData('Lucarelli_RS49_TC005', 1); 
arLoadData('Lucarelli_RS49_TC006', 1); 
arLoadData('Lucarelli_RS49_TC007', 1); 
arLoadData('Lucarelli_RS49_TC008', 1); 
arLoadData('Lucarelli_RS49_TC009', 1); 
arLoadData('Lucarelli_RS49_TC010', 1); 
arLoadData('Lucarelli_RS49_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS49_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS49__Final', false, true); 


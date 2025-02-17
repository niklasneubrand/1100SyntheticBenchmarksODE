% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS43 
% Random seed:		0002143000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS43'); 

% Load the time-course data 
arLoadData('Lucarelli_RS43_TC001', 1); 
arLoadData('Lucarelli_RS43_TC002', 1); 
arLoadData('Lucarelli_RS43_TC003', 1); 
arLoadData('Lucarelli_RS43_TC004', 1); 
arLoadData('Lucarelli_RS43_TC005', 1); 
arLoadData('Lucarelli_RS43_TC006', 1); 
arLoadData('Lucarelli_RS43_TC007', 1); 
arLoadData('Lucarelli_RS43_TC008', 1); 
arLoadData('Lucarelli_RS43_TC009', 1); 
arLoadData('Lucarelli_RS43_TC010', 1); 
arLoadData('Lucarelli_RS43_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS43_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS43__Final', false, true); 


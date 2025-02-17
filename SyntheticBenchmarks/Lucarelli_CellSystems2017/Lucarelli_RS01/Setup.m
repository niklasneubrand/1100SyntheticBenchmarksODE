% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS01 
% Random seed:		0002101000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS01'); 

% Load the time-course data 
arLoadData('Lucarelli_RS01_TC001', 1); 
arLoadData('Lucarelli_RS01_TC002', 1); 
arLoadData('Lucarelli_RS01_TC003', 1); 
arLoadData('Lucarelli_RS01_TC004', 1); 
arLoadData('Lucarelli_RS01_TC005', 1); 
arLoadData('Lucarelli_RS01_TC006', 1); 
arLoadData('Lucarelli_RS01_TC007', 1); 
arLoadData('Lucarelli_RS01_TC008', 1); 
arLoadData('Lucarelli_RS01_TC009', 1); 
arLoadData('Lucarelli_RS01_TC010', 1); 
arLoadData('Lucarelli_RS01_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS01_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS01__Final', false, true); 


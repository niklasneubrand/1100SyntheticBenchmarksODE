% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS35 
% Random seed:		0002135000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS35'); 

% Load the time-course data 
arLoadData('Lucarelli_RS35_TC001', 1); 
arLoadData('Lucarelli_RS35_TC002', 1); 
arLoadData('Lucarelli_RS35_TC003', 1); 
arLoadData('Lucarelli_RS35_TC004', 1); 
arLoadData('Lucarelli_RS35_TC005', 1); 
arLoadData('Lucarelli_RS35_TC006', 1); 
arLoadData('Lucarelli_RS35_TC007', 1); 
arLoadData('Lucarelli_RS35_TC008', 1); 
arLoadData('Lucarelli_RS35_TC009', 1); 
arLoadData('Lucarelli_RS35_TC010', 1); 
arLoadData('Lucarelli_RS35_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS35_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS35__Final', false, true); 


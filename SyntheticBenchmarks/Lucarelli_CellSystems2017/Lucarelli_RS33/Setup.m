% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS33 
% Random seed:		0002133000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS33'); 

% Load the time-course data 
arLoadData('Lucarelli_RS33_TC001', 1); 
arLoadData('Lucarelli_RS33_TC002', 1); 
arLoadData('Lucarelli_RS33_TC003', 1); 
arLoadData('Lucarelli_RS33_TC004', 1); 
arLoadData('Lucarelli_RS33_TC005', 1); 
arLoadData('Lucarelli_RS33_TC006', 1); 
arLoadData('Lucarelli_RS33_TC007', 1); 
arLoadData('Lucarelli_RS33_TC008', 1); 
arLoadData('Lucarelli_RS33_TC009', 1); 
arLoadData('Lucarelli_RS33_TC010', 1); 
arLoadData('Lucarelli_RS33_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS33_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS33__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS11 
% Random seed:		0002111000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS11'); 

% Load the time-course data 
arLoadData('Lucarelli_RS11_TC001', 1); 
arLoadData('Lucarelli_RS11_TC002', 1); 
arLoadData('Lucarelli_RS11_TC003', 1); 
arLoadData('Lucarelli_RS11_TC004', 1); 
arLoadData('Lucarelli_RS11_TC005', 1); 
arLoadData('Lucarelli_RS11_TC006', 1); 
arLoadData('Lucarelli_RS11_TC007', 1); 
arLoadData('Lucarelli_RS11_TC008', 1); 
arLoadData('Lucarelli_RS11_TC009', 1); 
arLoadData('Lucarelli_RS11_TC010', 1); 
arLoadData('Lucarelli_RS11_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS11_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS11__Final', false, true); 


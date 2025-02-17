% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS09 
% Random seed:		0002109000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS09'); 

% Load the time-course data 
arLoadData('Lucarelli_RS09_TC001', 1); 
arLoadData('Lucarelli_RS09_TC002', 1); 
arLoadData('Lucarelli_RS09_TC003', 1); 
arLoadData('Lucarelli_RS09_TC004', 1); 
arLoadData('Lucarelli_RS09_TC005', 1); 
arLoadData('Lucarelli_RS09_TC006', 1); 
arLoadData('Lucarelli_RS09_TC007', 1); 
arLoadData('Lucarelli_RS09_TC008', 1); 
arLoadData('Lucarelli_RS09_TC009', 1); 
arLoadData('Lucarelli_RS09_TC010', 1); 
arLoadData('Lucarelli_RS09_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS09_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS09__Final', false, true); 


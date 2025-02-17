% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS45 
% Random seed:		0002145000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS45'); 

% Load the time-course data 
arLoadData('Lucarelli_RS45_TC001', 1); 
arLoadData('Lucarelli_RS45_TC002', 1); 
arLoadData('Lucarelli_RS45_TC003', 1); 
arLoadData('Lucarelli_RS45_TC004', 1); 
arLoadData('Lucarelli_RS45_TC005', 1); 
arLoadData('Lucarelli_RS45_TC006', 1); 
arLoadData('Lucarelli_RS45_TC007', 1); 
arLoadData('Lucarelli_RS45_TC008', 1); 
arLoadData('Lucarelli_RS45_TC009', 1); 
arLoadData('Lucarelli_RS45_TC010', 1); 
arLoadData('Lucarelli_RS45_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS45_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS45__Final', false, true); 


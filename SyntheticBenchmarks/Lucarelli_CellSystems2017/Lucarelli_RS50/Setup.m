% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS50 
% Random seed:		0002150000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS50'); 

% Load the time-course data 
arLoadData('Lucarelli_RS50_TC001', 1); 
arLoadData('Lucarelli_RS50_TC002', 1); 
arLoadData('Lucarelli_RS50_TC003', 1); 
arLoadData('Lucarelli_RS50_TC004', 1); 
arLoadData('Lucarelli_RS50_TC005', 1); 
arLoadData('Lucarelli_RS50_TC006', 1); 
arLoadData('Lucarelli_RS50_TC007', 1); 
arLoadData('Lucarelli_RS50_TC008', 1); 
arLoadData('Lucarelli_RS50_TC009', 1); 
arLoadData('Lucarelli_RS50_TC010', 1); 
arLoadData('Lucarelli_RS50_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS50_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS50__Final', false, true); 


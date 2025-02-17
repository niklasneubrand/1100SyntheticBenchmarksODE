% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS37 
% Random seed:		0002137000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS37'); 

% Load the time-course data 
arLoadData('Lucarelli_RS37_TC001', 1); 
arLoadData('Lucarelli_RS37_TC002', 1); 
arLoadData('Lucarelli_RS37_TC003', 1); 
arLoadData('Lucarelli_RS37_TC004', 1); 
arLoadData('Lucarelli_RS37_TC005', 1); 
arLoadData('Lucarelli_RS37_TC006', 1); 
arLoadData('Lucarelli_RS37_TC007', 1); 
arLoadData('Lucarelli_RS37_TC008', 1); 
arLoadData('Lucarelli_RS37_TC009', 1); 
arLoadData('Lucarelli_RS37_TC010', 1); 
arLoadData('Lucarelli_RS37_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS37_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS37__Final', false, true); 


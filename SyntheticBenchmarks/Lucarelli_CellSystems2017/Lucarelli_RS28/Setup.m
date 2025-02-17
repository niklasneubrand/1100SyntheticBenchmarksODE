% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS28 
% Random seed:		0002128000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS28'); 

% Load the time-course data 
arLoadData('Lucarelli_RS28_TC001', 1); 
arLoadData('Lucarelli_RS28_TC002', 1); 
arLoadData('Lucarelli_RS28_TC003', 1); 
arLoadData('Lucarelli_RS28_TC004', 1); 
arLoadData('Lucarelli_RS28_TC005', 1); 
arLoadData('Lucarelli_RS28_TC006', 1); 
arLoadData('Lucarelli_RS28_TC007', 1); 
arLoadData('Lucarelli_RS28_TC008', 1); 
arLoadData('Lucarelli_RS28_TC009', 1); 
arLoadData('Lucarelli_RS28_TC010', 1); 
arLoadData('Lucarelli_RS28_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS28_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS28__Final', false, true); 


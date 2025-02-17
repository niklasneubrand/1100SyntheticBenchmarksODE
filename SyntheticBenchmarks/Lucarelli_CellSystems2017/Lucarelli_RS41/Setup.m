% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS41 
% Random seed:		0002141000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS41'); 

% Load the time-course data 
arLoadData('Lucarelli_RS41_TC001', 1); 
arLoadData('Lucarelli_RS41_TC002', 1); 
arLoadData('Lucarelli_RS41_TC003', 1); 
arLoadData('Lucarelli_RS41_TC004', 1); 
arLoadData('Lucarelli_RS41_TC005', 1); 
arLoadData('Lucarelli_RS41_TC006', 1); 
arLoadData('Lucarelli_RS41_TC007', 1); 
arLoadData('Lucarelli_RS41_TC008', 1); 
arLoadData('Lucarelli_RS41_TC009', 1); 
arLoadData('Lucarelli_RS41_TC010', 1); 
arLoadData('Lucarelli_RS41_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS41_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS41__Final', false, true); 


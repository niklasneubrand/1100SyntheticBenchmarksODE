% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS47 
% Random seed:		0002147000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS47'); 

% Load the time-course data 
arLoadData('Lucarelli_RS47_TC001', 1); 
arLoadData('Lucarelli_RS47_TC002', 1); 
arLoadData('Lucarelli_RS47_TC003', 1); 
arLoadData('Lucarelli_RS47_TC004', 1); 
arLoadData('Lucarelli_RS47_TC005', 1); 
arLoadData('Lucarelli_RS47_TC006', 1); 
arLoadData('Lucarelli_RS47_TC007', 1); 
arLoadData('Lucarelli_RS47_TC008', 1); 
arLoadData('Lucarelli_RS47_TC009', 1); 
arLoadData('Lucarelli_RS47_TC010', 1); 
arLoadData('Lucarelli_RS47_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS47_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS47__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS31 
% Random seed:		0002131000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS31'); 

% Load the time-course data 
arLoadData('Lucarelli_RS31_TC001', 1); 
arLoadData('Lucarelli_RS31_TC002', 1); 
arLoadData('Lucarelli_RS31_TC003', 1); 
arLoadData('Lucarelli_RS31_TC004', 1); 
arLoadData('Lucarelli_RS31_TC005', 1); 
arLoadData('Lucarelli_RS31_TC006', 1); 
arLoadData('Lucarelli_RS31_TC007', 1); 
arLoadData('Lucarelli_RS31_TC008', 1); 
arLoadData('Lucarelli_RS31_TC009', 1); 
arLoadData('Lucarelli_RS31_TC010', 1); 
arLoadData('Lucarelli_RS31_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS31_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS31__Final', false, true); 


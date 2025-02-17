% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS16 
% Random seed:		0002116000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS16'); 

% Load the time-course data 
arLoadData('Lucarelli_RS16_TC001', 1); 
arLoadData('Lucarelli_RS16_TC002', 1); 
arLoadData('Lucarelli_RS16_TC003', 1); 
arLoadData('Lucarelli_RS16_TC004', 1); 
arLoadData('Lucarelli_RS16_TC005', 1); 
arLoadData('Lucarelli_RS16_TC006', 1); 
arLoadData('Lucarelli_RS16_TC007', 1); 
arLoadData('Lucarelli_RS16_TC008', 1); 
arLoadData('Lucarelli_RS16_TC009', 1); 
arLoadData('Lucarelli_RS16_TC010', 1); 
arLoadData('Lucarelli_RS16_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS16_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS16__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS14 
% Random seed:		0002114000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS14'); 

% Load the time-course data 
arLoadData('Lucarelli_RS14_TC001', 1); 
arLoadData('Lucarelli_RS14_TC002', 1); 
arLoadData('Lucarelli_RS14_TC003', 1); 
arLoadData('Lucarelli_RS14_TC004', 1); 
arLoadData('Lucarelli_RS14_TC005', 1); 
arLoadData('Lucarelli_RS14_TC006', 1); 
arLoadData('Lucarelli_RS14_TC007', 1); 
arLoadData('Lucarelli_RS14_TC008', 1); 
arLoadData('Lucarelli_RS14_TC009', 1); 
arLoadData('Lucarelli_RS14_TC010', 1); 
arLoadData('Lucarelli_RS14_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS14_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS14__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS02 
% Random seed:		0002102000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS02'); 

% Load the time-course data 
arLoadData('Lucarelli_RS02_TC001', 1); 
arLoadData('Lucarelli_RS02_TC002', 1); 
arLoadData('Lucarelli_RS02_TC003', 1); 
arLoadData('Lucarelli_RS02_TC004', 1); 
arLoadData('Lucarelli_RS02_TC005', 1); 
arLoadData('Lucarelli_RS02_TC006', 1); 
arLoadData('Lucarelli_RS02_TC007', 1); 
arLoadData('Lucarelli_RS02_TC008', 1); 
arLoadData('Lucarelli_RS02_TC009', 1); 
arLoadData('Lucarelli_RS02_TC010', 1); 
arLoadData('Lucarelli_RS02_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS02_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS02__Final', false, true); 


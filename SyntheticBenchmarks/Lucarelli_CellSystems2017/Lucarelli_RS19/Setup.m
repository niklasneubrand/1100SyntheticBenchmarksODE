% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS19 
% Random seed:		0002119000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS19'); 

% Load the time-course data 
arLoadData('Lucarelli_RS19_TC001', 1); 
arLoadData('Lucarelli_RS19_TC002', 1); 
arLoadData('Lucarelli_RS19_TC003', 1); 
arLoadData('Lucarelli_RS19_TC004', 1); 
arLoadData('Lucarelli_RS19_TC005', 1); 
arLoadData('Lucarelli_RS19_TC006', 1); 
arLoadData('Lucarelli_RS19_TC007', 1); 
arLoadData('Lucarelli_RS19_TC008', 1); 
arLoadData('Lucarelli_RS19_TC009', 1); 
arLoadData('Lucarelli_RS19_TC010', 1); 
arLoadData('Lucarelli_RS19_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS19_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS19__Final', false, true); 


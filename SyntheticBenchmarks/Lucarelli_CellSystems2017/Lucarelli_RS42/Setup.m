% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS42 
% Random seed:		0002142000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS42'); 

% Load the time-course data 
arLoadData('Lucarelli_RS42_TC001', 1); 
arLoadData('Lucarelli_RS42_TC002', 1); 
arLoadData('Lucarelli_RS42_TC003', 1); 
arLoadData('Lucarelli_RS42_TC004', 1); 
arLoadData('Lucarelli_RS42_TC005', 1); 
arLoadData('Lucarelli_RS42_TC006', 1); 
arLoadData('Lucarelli_RS42_TC007', 1); 
arLoadData('Lucarelli_RS42_TC008', 1); 
arLoadData('Lucarelli_RS42_TC009', 1); 
arLoadData('Lucarelli_RS42_TC010', 1); 
arLoadData('Lucarelli_RS42_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS42_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS42__Final', false, true); 


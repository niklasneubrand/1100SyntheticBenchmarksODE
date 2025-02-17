% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS08 
% Random seed:		0002108000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS08'); 

% Load the time-course data 
arLoadData('Lucarelli_RS08_TC001', 1); 
arLoadData('Lucarelli_RS08_TC002', 1); 
arLoadData('Lucarelli_RS08_TC003', 1); 
arLoadData('Lucarelli_RS08_TC004', 1); 
arLoadData('Lucarelli_RS08_TC005', 1); 
arLoadData('Lucarelli_RS08_TC006', 1); 
arLoadData('Lucarelli_RS08_TC007', 1); 
arLoadData('Lucarelli_RS08_TC008', 1); 
arLoadData('Lucarelli_RS08_TC009', 1); 
arLoadData('Lucarelli_RS08_TC010', 1); 
arLoadData('Lucarelli_RS08_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS08_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS08__Final', false, true); 


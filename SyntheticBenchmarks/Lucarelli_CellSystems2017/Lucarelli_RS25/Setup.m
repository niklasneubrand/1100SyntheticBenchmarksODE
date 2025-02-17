% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS25 
% Random seed:		0002125000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS25'); 

% Load the time-course data 
arLoadData('Lucarelli_RS25_TC001', 1); 
arLoadData('Lucarelli_RS25_TC002', 1); 
arLoadData('Lucarelli_RS25_TC003', 1); 
arLoadData('Lucarelli_RS25_TC004', 1); 
arLoadData('Lucarelli_RS25_TC005', 1); 
arLoadData('Lucarelli_RS25_TC006', 1); 
arLoadData('Lucarelli_RS25_TC007', 1); 
arLoadData('Lucarelli_RS25_TC008', 1); 
arLoadData('Lucarelli_RS25_TC009', 1); 
arLoadData('Lucarelli_RS25_TC010', 1); 
arLoadData('Lucarelli_RS25_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS25_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS25__Final', false, true); 


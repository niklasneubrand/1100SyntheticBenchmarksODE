% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS24 
% Random seed:		0002124000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS24'); 

% Load the time-course data 
arLoadData('Lucarelli_RS24_TC001', 1); 
arLoadData('Lucarelli_RS24_TC002', 1); 
arLoadData('Lucarelli_RS24_TC003', 1); 
arLoadData('Lucarelli_RS24_TC004', 1); 
arLoadData('Lucarelli_RS24_TC005', 1); 
arLoadData('Lucarelli_RS24_TC006', 1); 
arLoadData('Lucarelli_RS24_TC007', 1); 
arLoadData('Lucarelli_RS24_TC008', 1); 
arLoadData('Lucarelli_RS24_TC009', 1); 
arLoadData('Lucarelli_RS24_TC010', 1); 
arLoadData('Lucarelli_RS24_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS24_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS24__Final', false, true); 


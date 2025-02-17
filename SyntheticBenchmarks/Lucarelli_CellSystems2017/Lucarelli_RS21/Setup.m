% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS21 
% Random seed:		0002121000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS21'); 

% Load the time-course data 
arLoadData('Lucarelli_RS21_TC001', 1); 
arLoadData('Lucarelli_RS21_TC002', 1); 
arLoadData('Lucarelli_RS21_TC003', 1); 
arLoadData('Lucarelli_RS21_TC004', 1); 
arLoadData('Lucarelli_RS21_TC005', 1); 
arLoadData('Lucarelli_RS21_TC006', 1); 
arLoadData('Lucarelli_RS21_TC007', 1); 
arLoadData('Lucarelli_RS21_TC008', 1); 
arLoadData('Lucarelli_RS21_TC009', 1); 
arLoadData('Lucarelli_RS21_TC010', 1); 
arLoadData('Lucarelli_RS21_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS21_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS21__Final', false, true); 


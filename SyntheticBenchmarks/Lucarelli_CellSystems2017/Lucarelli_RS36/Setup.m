% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS36 
% Random seed:		0002136000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS36'); 

% Load the time-course data 
arLoadData('Lucarelli_RS36_TC001', 1); 
arLoadData('Lucarelli_RS36_TC002', 1); 
arLoadData('Lucarelli_RS36_TC003', 1); 
arLoadData('Lucarelli_RS36_TC004', 1); 
arLoadData('Lucarelli_RS36_TC005', 1); 
arLoadData('Lucarelli_RS36_TC006', 1); 
arLoadData('Lucarelli_RS36_TC007', 1); 
arLoadData('Lucarelli_RS36_TC008', 1); 
arLoadData('Lucarelli_RS36_TC009', 1); 
arLoadData('Lucarelli_RS36_TC010', 1); 
arLoadData('Lucarelli_RS36_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS36_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS36__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS34 
% Random seed:		0002134000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS34'); 

% Load the time-course data 
arLoadData('Lucarelli_RS34_TC001', 1); 
arLoadData('Lucarelli_RS34_TC002', 1); 
arLoadData('Lucarelli_RS34_TC003', 1); 
arLoadData('Lucarelli_RS34_TC004', 1); 
arLoadData('Lucarelli_RS34_TC005', 1); 
arLoadData('Lucarelli_RS34_TC006', 1); 
arLoadData('Lucarelli_RS34_TC007', 1); 
arLoadData('Lucarelli_RS34_TC008', 1); 
arLoadData('Lucarelli_RS34_TC009', 1); 
arLoadData('Lucarelli_RS34_TC010', 1); 
arLoadData('Lucarelli_RS34_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS34_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS34__Final', false, true); 


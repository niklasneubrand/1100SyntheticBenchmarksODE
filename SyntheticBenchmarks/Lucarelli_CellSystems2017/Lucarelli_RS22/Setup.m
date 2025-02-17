% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS22 
% Random seed:		0002122000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS22'); 

% Load the time-course data 
arLoadData('Lucarelli_RS22_TC001', 1); 
arLoadData('Lucarelli_RS22_TC002', 1); 
arLoadData('Lucarelli_RS22_TC003', 1); 
arLoadData('Lucarelli_RS22_TC004', 1); 
arLoadData('Lucarelli_RS22_TC005', 1); 
arLoadData('Lucarelli_RS22_TC006', 1); 
arLoadData('Lucarelli_RS22_TC007', 1); 
arLoadData('Lucarelli_RS22_TC008', 1); 
arLoadData('Lucarelli_RS22_TC009', 1); 
arLoadData('Lucarelli_RS22_TC010', 1); 
arLoadData('Lucarelli_RS22_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS22_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS22__Final', false, true); 


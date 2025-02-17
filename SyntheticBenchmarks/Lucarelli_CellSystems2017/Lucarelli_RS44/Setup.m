% Setup File For Realistic Simulation
% Original project:	Lucarelli_CellSystems2017 
% RS project name:	Lucarelli_RS44 
% Random seed:		0002144000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Lucarelli_RS44'); 

% Load the time-course data 
arLoadData('Lucarelli_RS44_TC001', 1); 
arLoadData('Lucarelli_RS44_TC002', 1); 
arLoadData('Lucarelli_RS44_TC003', 1); 
arLoadData('Lucarelli_RS44_TC004', 1); 
arLoadData('Lucarelli_RS44_TC005', 1); 
arLoadData('Lucarelli_RS44_TC006', 1); 
arLoadData('Lucarelli_RS44_TC007', 1); 
arLoadData('Lucarelli_RS44_TC008', 1); 
arLoadData('Lucarelli_RS44_TC009', 1); 
arLoadData('Lucarelli_RS44_TC010', 1); 
arLoadData('Lucarelli_RS44_TC011', 1); 

% Load the dose-response data 
arLoadData('Lucarelli_RS44_DR001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Lucarelli_RS44__Final', false, true); 


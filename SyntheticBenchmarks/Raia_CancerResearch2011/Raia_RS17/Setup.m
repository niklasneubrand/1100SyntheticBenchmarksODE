% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS17 
% Random seed:		0001217000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS17'); 

% Load the time-course data 
arLoadData('Raia_RS17_TC001', 1); 
arLoadData('Raia_RS17_TC002', 1); 
arLoadData('Raia_RS17_TC003', 1); 
arLoadData('Raia_RS17_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS17__Final', false, true); 


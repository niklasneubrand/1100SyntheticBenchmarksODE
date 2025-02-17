% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS43 
% Random seed:		0001243000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS43'); 

% Load the time-course data 
arLoadData('Raia_RS43_TC001', 1); 
arLoadData('Raia_RS43_TC002', 1); 
arLoadData('Raia_RS43_TC003', 1); 
arLoadData('Raia_RS43_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS43__Final', false, true); 


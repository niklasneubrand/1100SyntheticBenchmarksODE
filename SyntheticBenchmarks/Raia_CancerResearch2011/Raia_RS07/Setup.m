% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS07 
% Random seed:		0001207000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS07'); 

% Load the time-course data 
arLoadData('Raia_RS07_TC001', 1); 
arLoadData('Raia_RS07_TC002', 1); 
arLoadData('Raia_RS07_TC003', 1); 
arLoadData('Raia_RS07_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS07__Final', false, true); 


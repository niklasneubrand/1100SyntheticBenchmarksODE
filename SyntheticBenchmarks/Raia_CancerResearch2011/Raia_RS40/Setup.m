% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS40 
% Random seed:		0001240000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS40'); 

% Load the time-course data 
arLoadData('Raia_RS40_TC001', 1); 
arLoadData('Raia_RS40_TC002', 1); 
arLoadData('Raia_RS40_TC003', 1); 
arLoadData('Raia_RS40_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS40__Final', false, true); 


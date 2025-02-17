% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS29 
% Random seed:		0001229000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS29'); 

% Load the time-course data 
arLoadData('Raia_RS29_TC001', 1); 
arLoadData('Raia_RS29_TC002', 1); 
arLoadData('Raia_RS29_TC003', 1); 
arLoadData('Raia_RS29_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS29__Final', false, true); 


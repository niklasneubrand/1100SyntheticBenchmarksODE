% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS50 
% Random seed:		0001250000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS50'); 

% Load the time-course data 
arLoadData('Raia_RS50_TC001', 1); 
arLoadData('Raia_RS50_TC002', 1); 
arLoadData('Raia_RS50_TC003', 1); 
arLoadData('Raia_RS50_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS50__Final', false, true); 


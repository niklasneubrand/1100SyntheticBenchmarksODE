% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS46 
% Random seed:		0001246000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS46'); 

% Load the time-course data 
arLoadData('Raia_RS46_TC001', 1); 
arLoadData('Raia_RS46_TC002', 1); 
arLoadData('Raia_RS46_TC003', 1); 
arLoadData('Raia_RS46_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS46__Final', false, true); 


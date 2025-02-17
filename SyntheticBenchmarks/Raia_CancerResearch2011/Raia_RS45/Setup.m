% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS45 
% Random seed:		0001245000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS45'); 

% Load the time-course data 
arLoadData('Raia_RS45_TC001', 1); 
arLoadData('Raia_RS45_TC002', 1); 
arLoadData('Raia_RS45_TC003', 1); 
arLoadData('Raia_RS45_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS45__Final', false, true); 


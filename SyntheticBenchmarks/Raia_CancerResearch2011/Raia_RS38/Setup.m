% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS38 
% Random seed:		0001238000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS38'); 

% Load the time-course data 
arLoadData('Raia_RS38_TC001', 1); 
arLoadData('Raia_RS38_TC002', 1); 
arLoadData('Raia_RS38_TC003', 1); 
arLoadData('Raia_RS38_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS38__Final', false, true); 


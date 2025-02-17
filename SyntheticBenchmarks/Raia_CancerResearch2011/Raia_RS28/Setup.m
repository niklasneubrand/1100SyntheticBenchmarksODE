% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS28 
% Random seed:		0001228000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS28'); 

% Load the time-course data 
arLoadData('Raia_RS28_TC001', 1); 
arLoadData('Raia_RS28_TC002', 1); 
arLoadData('Raia_RS28_TC003', 1); 
arLoadData('Raia_RS28_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS28__Final', false, true); 


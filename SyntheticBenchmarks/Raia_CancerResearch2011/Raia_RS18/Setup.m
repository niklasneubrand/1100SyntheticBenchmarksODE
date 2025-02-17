% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS18 
% Random seed:		0001218000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS18'); 

% Load the time-course data 
arLoadData('Raia_RS18_TC001', 1); 
arLoadData('Raia_RS18_TC002', 1); 
arLoadData('Raia_RS18_TC003', 1); 
arLoadData('Raia_RS18_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS18__Final', false, true); 


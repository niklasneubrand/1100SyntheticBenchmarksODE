% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS31 
% Random seed:		0001231000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS31'); 

% Load the time-course data 
arLoadData('Raia_RS31_TC001', 1); 
arLoadData('Raia_RS31_TC002', 1); 
arLoadData('Raia_RS31_TC003', 1); 
arLoadData('Raia_RS31_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS31__Final', false, true); 


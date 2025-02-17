% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS39 
% Random seed:		0001239000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS39'); 

% Load the time-course data 
arLoadData('Raia_RS39_TC001', 1); 
arLoadData('Raia_RS39_TC002', 1); 
arLoadData('Raia_RS39_TC003', 1); 
arLoadData('Raia_RS39_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS39__Final', false, true); 


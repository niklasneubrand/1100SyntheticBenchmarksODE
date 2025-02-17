% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS04 
% Random seed:		0001204000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS04'); 

% Load the time-course data 
arLoadData('Raia_RS04_TC001', 1); 
arLoadData('Raia_RS04_TC002', 1); 
arLoadData('Raia_RS04_TC003', 1); 
arLoadData('Raia_RS04_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS04__Final', false, true); 


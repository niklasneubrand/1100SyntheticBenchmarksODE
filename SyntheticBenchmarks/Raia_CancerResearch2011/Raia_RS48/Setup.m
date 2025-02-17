% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS48 
% Random seed:		0001248000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS48'); 

% Load the time-course data 
arLoadData('Raia_RS48_TC001', 1); 
arLoadData('Raia_RS48_TC002', 1); 
arLoadData('Raia_RS48_TC003', 1); 
arLoadData('Raia_RS48_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS48__Final', false, true); 


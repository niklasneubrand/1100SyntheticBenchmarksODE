% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS01 
% Random seed:		0001201000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS01'); 

% Load the time-course data 
arLoadData('Raia_RS01_TC001', 1); 
arLoadData('Raia_RS01_TC002', 1); 
arLoadData('Raia_RS01_TC003', 1); 
arLoadData('Raia_RS01_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS01__Final', false, true); 


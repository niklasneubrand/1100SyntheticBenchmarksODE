% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS22 
% Random seed:		0001222000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS22'); 

% Load the time-course data 
arLoadData('Raia_RS22_TC001', 1); 
arLoadData('Raia_RS22_TC002', 1); 
arLoadData('Raia_RS22_TC003', 1); 
arLoadData('Raia_RS22_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS22__Final', false, true); 


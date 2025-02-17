% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS10 
% Random seed:		0001210000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS10'); 

% Load the time-course data 
arLoadData('Raia_RS10_TC001', 1); 
arLoadData('Raia_RS10_TC002', 1); 
arLoadData('Raia_RS10_TC003', 1); 
arLoadData('Raia_RS10_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS10__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS15 
% Random seed:		0001215000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS15'); 

% Load the time-course data 
arLoadData('Raia_RS15_TC001', 1); 
arLoadData('Raia_RS15_TC002', 1); 
arLoadData('Raia_RS15_TC003', 1); 
arLoadData('Raia_RS15_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS15__Final', false, true); 


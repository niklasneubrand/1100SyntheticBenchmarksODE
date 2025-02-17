% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS24 
% Random seed:		0001224000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS24'); 

% Load the time-course data 
arLoadData('Raia_RS24_TC001', 1); 
arLoadData('Raia_RS24_TC002', 1); 
arLoadData('Raia_RS24_TC003', 1); 
arLoadData('Raia_RS24_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS24__Final', false, true); 


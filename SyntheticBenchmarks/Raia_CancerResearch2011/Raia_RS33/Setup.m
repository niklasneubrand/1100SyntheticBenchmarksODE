% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS33 
% Random seed:		0001233000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS33'); 

% Load the time-course data 
arLoadData('Raia_RS33_TC001', 1); 
arLoadData('Raia_RS33_TC002', 1); 
arLoadData('Raia_RS33_TC003', 1); 
arLoadData('Raia_RS33_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS33__Final', false, true); 


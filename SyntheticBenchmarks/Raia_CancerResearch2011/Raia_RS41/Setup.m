% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS41 
% Random seed:		0001241000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS41'); 

% Load the time-course data 
arLoadData('Raia_RS41_TC001', 1); 
arLoadData('Raia_RS41_TC002', 1); 
arLoadData('Raia_RS41_TC003', 1); 
arLoadData('Raia_RS41_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS41__Final', false, true); 


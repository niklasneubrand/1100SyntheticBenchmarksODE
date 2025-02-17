% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS27 
% Random seed:		0001227000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS27'); 

% Load the time-course data 
arLoadData('Raia_RS27_TC001', 1); 
arLoadData('Raia_RS27_TC002', 1); 
arLoadData('Raia_RS27_TC003', 1); 
arLoadData('Raia_RS27_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS27__Final', false, true); 


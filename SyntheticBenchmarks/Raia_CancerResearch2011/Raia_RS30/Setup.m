% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS30 
% Random seed:		0001230000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS30'); 

% Load the time-course data 
arLoadData('Raia_RS30_TC001', 1); 
arLoadData('Raia_RS30_TC002', 1); 
arLoadData('Raia_RS30_TC003', 1); 
arLoadData('Raia_RS30_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS30__Final', false, true); 


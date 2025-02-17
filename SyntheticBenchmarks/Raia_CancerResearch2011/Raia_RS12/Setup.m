% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS12 
% Random seed:		0001212000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS12'); 

% Load the time-course data 
arLoadData('Raia_RS12_TC001', 1); 
arLoadData('Raia_RS12_TC002', 1); 
arLoadData('Raia_RS12_TC003', 1); 
arLoadData('Raia_RS12_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS12__Final', false, true); 


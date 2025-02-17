% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS13 
% Random seed:		0001213000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS13'); 

% Load the time-course data 
arLoadData('Raia_RS13_TC001', 1); 
arLoadData('Raia_RS13_TC002', 1); 
arLoadData('Raia_RS13_TC003', 1); 
arLoadData('Raia_RS13_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS13__Final', false, true); 


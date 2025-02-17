% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS26 
% Random seed:		0001226000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS26'); 

% Load the time-course data 
arLoadData('Raia_RS26_TC001', 1); 
arLoadData('Raia_RS26_TC002', 1); 
arLoadData('Raia_RS26_TC003', 1); 
arLoadData('Raia_RS26_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS26__Final', false, true); 


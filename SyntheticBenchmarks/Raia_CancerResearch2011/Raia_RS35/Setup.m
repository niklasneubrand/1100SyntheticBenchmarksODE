% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS35 
% Random seed:		0001235000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS35'); 

% Load the time-course data 
arLoadData('Raia_RS35_TC001', 1); 
arLoadData('Raia_RS35_TC002', 1); 
arLoadData('Raia_RS35_TC003', 1); 
arLoadData('Raia_RS35_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS35__Final', false, true); 


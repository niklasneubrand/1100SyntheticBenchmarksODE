% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS14 
% Random seed:		0001214000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS14'); 

% Load the time-course data 
arLoadData('Raia_RS14_TC001', 1); 
arLoadData('Raia_RS14_TC002', 1); 
arLoadData('Raia_RS14_TC003', 1); 
arLoadData('Raia_RS14_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS14__Final', false, true); 


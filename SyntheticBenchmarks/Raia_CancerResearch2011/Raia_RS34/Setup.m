% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS34 
% Random seed:		0001234000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS34'); 

% Load the time-course data 
arLoadData('Raia_RS34_TC001', 1); 
arLoadData('Raia_RS34_TC002', 1); 
arLoadData('Raia_RS34_TC003', 1); 
arLoadData('Raia_RS34_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS34__Final', false, true); 


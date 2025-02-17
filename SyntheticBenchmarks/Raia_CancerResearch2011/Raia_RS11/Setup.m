% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS11 
% Random seed:		0001211000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS11'); 

% Load the time-course data 
arLoadData('Raia_RS11_TC001', 1); 
arLoadData('Raia_RS11_TC002', 1); 
arLoadData('Raia_RS11_TC003', 1); 
arLoadData('Raia_RS11_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS11__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS06 
% Random seed:		0001206000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS06'); 

% Load the time-course data 
arLoadData('Raia_RS06_TC001', 1); 
arLoadData('Raia_RS06_TC002', 1); 
arLoadData('Raia_RS06_TC003', 1); 
arLoadData('Raia_RS06_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS06__Final', false, true); 


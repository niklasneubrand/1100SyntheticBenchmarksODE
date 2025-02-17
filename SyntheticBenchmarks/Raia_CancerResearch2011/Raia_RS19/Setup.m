% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS19 
% Random seed:		0001219000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS19'); 

% Load the time-course data 
arLoadData('Raia_RS19_TC001', 1); 
arLoadData('Raia_RS19_TC002', 1); 
arLoadData('Raia_RS19_TC003', 1); 
arLoadData('Raia_RS19_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS19__Final', false, true); 


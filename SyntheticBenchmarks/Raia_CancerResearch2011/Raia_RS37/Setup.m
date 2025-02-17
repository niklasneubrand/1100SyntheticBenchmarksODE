% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS37 
% Random seed:		0001237000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS37'); 

% Load the time-course data 
arLoadData('Raia_RS37_TC001', 1); 
arLoadData('Raia_RS37_TC002', 1); 
arLoadData('Raia_RS37_TC003', 1); 
arLoadData('Raia_RS37_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS37__Final', false, true); 


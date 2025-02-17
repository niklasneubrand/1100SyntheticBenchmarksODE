% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS21 
% Random seed:		0001221000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS21'); 

% Load the time-course data 
arLoadData('Raia_RS21_TC001', 1); 
arLoadData('Raia_RS21_TC002', 1); 
arLoadData('Raia_RS21_TC003', 1); 
arLoadData('Raia_RS21_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS21__Final', false, true); 


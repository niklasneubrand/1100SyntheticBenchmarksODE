% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS20 
% Random seed:		0001220000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS20'); 

% Load the time-course data 
arLoadData('Raia_RS20_TC001', 1); 
arLoadData('Raia_RS20_TC002', 1); 
arLoadData('Raia_RS20_TC003', 1); 
arLoadData('Raia_RS20_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS20__Final', false, true); 


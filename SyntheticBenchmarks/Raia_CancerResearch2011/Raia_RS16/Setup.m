% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS16 
% Random seed:		0001216000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS16'); 

% Load the time-course data 
arLoadData('Raia_RS16_TC001', 1); 
arLoadData('Raia_RS16_TC002', 1); 
arLoadData('Raia_RS16_TC003', 1); 
arLoadData('Raia_RS16_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS16__Final', false, true); 


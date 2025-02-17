% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS08 
% Random seed:		0001208000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS08'); 

% Load the time-course data 
arLoadData('Raia_RS08_TC001', 1); 
arLoadData('Raia_RS08_TC002', 1); 
arLoadData('Raia_RS08_TC003', 1); 
arLoadData('Raia_RS08_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS08__Final', false, true); 


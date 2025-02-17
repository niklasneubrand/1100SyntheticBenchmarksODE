% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS44 
% Random seed:		0001244000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS44'); 

% Load the time-course data 
arLoadData('Raia_RS44_TC001', 1); 
arLoadData('Raia_RS44_TC002', 1); 
arLoadData('Raia_RS44_TC003', 1); 
arLoadData('Raia_RS44_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS44__Final', false, true); 


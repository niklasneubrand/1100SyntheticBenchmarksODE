% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS46 
% Random seed:		0000146000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS46'); 

% Load the time-course data 
arLoadData('Becker_RS46_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS46__Final', false, true); 


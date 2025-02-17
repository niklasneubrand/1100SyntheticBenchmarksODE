% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS39 
% Random seed:		0000139000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS39'); 

% Load the time-course data 
arLoadData('Becker_RS39_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS39__Final', false, true); 


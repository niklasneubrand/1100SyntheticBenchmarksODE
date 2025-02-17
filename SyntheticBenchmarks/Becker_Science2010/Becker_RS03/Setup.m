% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS03 
% Random seed:		0000103000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS03'); 

% Load the time-course data 
arLoadData('Becker_RS03_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS03__Final', false, true); 


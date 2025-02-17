% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS29 
% Random seed:		0000129000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS29'); 

% Load the time-course data 
arLoadData('Becker_RS29_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS29__Final', false, true); 


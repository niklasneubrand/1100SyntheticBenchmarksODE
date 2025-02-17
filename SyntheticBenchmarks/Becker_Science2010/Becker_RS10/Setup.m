% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS10 
% Random seed:		0000110000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS10'); 

% Load the time-course data 
arLoadData('Becker_RS10_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS10__Final', false, true); 


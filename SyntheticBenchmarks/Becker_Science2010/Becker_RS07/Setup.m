% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS07 
% Random seed:		0000107000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS07'); 

% Load the time-course data 
arLoadData('Becker_RS07_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS07__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS18 
% Random seed:		0000118000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS18'); 

% Load the time-course data 
arLoadData('Becker_RS18_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS18__Final', false, true); 


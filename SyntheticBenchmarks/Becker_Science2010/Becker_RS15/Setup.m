% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS15 
% Random seed:		0000115000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS15'); 

% Load the time-course data 
arLoadData('Becker_RS15_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS15__Final', false, true); 


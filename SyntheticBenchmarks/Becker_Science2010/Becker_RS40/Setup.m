% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS40 
% Random seed:		0000140000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS40'); 

% Load the time-course data 
arLoadData('Becker_RS40_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS40__Final', false, true); 


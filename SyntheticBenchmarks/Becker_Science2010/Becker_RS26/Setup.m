% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS26 
% Random seed:		0000126000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS26'); 

% Load the time-course data 
arLoadData('Becker_RS26_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS26__Final', false, true); 


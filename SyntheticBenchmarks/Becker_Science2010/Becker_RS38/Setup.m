% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS38 
% Random seed:		0000138000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS38'); 

% Load the time-course data 
arLoadData('Becker_RS38_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS38__Final', false, true); 


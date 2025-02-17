% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS32 
% Random seed:		0000132000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS32'); 

% Load the time-course data 
arLoadData('Becker_RS32_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS32__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS05 
% Random seed:		0000105000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS05'); 

% Load the time-course data 
arLoadData('Becker_RS05_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS05__Final', false, true); 


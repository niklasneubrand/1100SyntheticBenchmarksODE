% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS30 
% Random seed:		0000130000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS30'); 

% Load the time-course data 
arLoadData('Becker_RS30_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS30__Final', false, true); 


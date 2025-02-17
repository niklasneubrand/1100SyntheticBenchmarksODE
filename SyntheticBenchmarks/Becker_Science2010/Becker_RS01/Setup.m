% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS01 
% Random seed:		0000101000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS01'); 

% Load the time-course data 
arLoadData('Becker_RS01_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS01__Final', false, true); 


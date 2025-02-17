% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS48 
% Random seed:		0000148000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS48'); 

% Load the time-course data 
arLoadData('Becker_RS48_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS48__Final', false, true); 


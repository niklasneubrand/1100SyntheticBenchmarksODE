% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS12 
% Random seed:		0000112000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS12'); 

% Load the time-course data 
arLoadData('Becker_RS12_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS12__Final', false, true); 


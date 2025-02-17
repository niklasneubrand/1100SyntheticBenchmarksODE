% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS28 
% Random seed:		0000128000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS28'); 

% Load the time-course data 
arLoadData('Becker_RS28_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS28__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS50 
% Random seed:		0000150000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS50'); 

% Load the time-course data 
arLoadData('Becker_RS50_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS50__Final', false, true); 


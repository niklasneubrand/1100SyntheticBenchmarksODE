% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS36 
% Random seed:		0000136000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS36'); 

% Load the time-course data 
arLoadData('Becker_RS36_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS36__Final', false, true); 


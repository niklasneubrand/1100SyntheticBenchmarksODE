% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS33 
% Random seed:		0000133000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS33'); 

% Load the time-course data 
arLoadData('Becker_RS33_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS33__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS31 
% Random seed:		0000131000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS31'); 

% Load the time-course data 
arLoadData('Becker_RS31_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS31__Final', false, true); 


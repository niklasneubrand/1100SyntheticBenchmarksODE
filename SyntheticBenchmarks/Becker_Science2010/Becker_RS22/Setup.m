% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS22 
% Random seed:		0000122000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS22'); 

% Load the time-course data 
arLoadData('Becker_RS22_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS22__Final', false, true); 


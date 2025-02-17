% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS06 
% Random seed:		0000106000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS06'); 

% Load the time-course data 
arLoadData('Becker_RS06_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS06__Final', false, true); 


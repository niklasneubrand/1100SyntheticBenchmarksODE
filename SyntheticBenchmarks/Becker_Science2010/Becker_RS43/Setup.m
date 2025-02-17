% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS43 
% Random seed:		0000143000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS43'); 

% Load the time-course data 
arLoadData('Becker_RS43_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS43__Final', false, true); 


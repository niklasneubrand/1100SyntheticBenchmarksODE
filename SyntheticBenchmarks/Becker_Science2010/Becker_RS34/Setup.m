% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS34 
% Random seed:		0000134000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS34'); 

% Load the time-course data 
arLoadData('Becker_RS34_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS34__Final', false, true); 


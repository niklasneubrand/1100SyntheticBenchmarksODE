% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS17 
% Random seed:		0000117000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS17'); 

% Load the time-course data 
arLoadData('Becker_RS17_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS17__Final', false, true); 


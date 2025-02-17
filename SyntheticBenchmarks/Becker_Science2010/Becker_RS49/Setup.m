% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS49 
% Random seed:		0000149000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS49'); 

% Load the time-course data 
arLoadData('Becker_RS49_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS49__Final', false, true); 


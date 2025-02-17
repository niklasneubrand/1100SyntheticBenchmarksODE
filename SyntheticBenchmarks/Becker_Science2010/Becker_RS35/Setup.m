% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS35 
% Random seed:		0000135000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS35'); 

% Load the time-course data 
arLoadData('Becker_RS35_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS35__Final', false, true); 


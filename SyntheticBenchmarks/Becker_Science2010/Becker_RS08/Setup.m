% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS08 
% Random seed:		0000108000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS08'); 

% Load the time-course data 
arLoadData('Becker_RS08_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS08__Final', false, true); 


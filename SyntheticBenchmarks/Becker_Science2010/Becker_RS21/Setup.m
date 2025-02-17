% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS21 
% Random seed:		0000121000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS21'); 

% Load the time-course data 
arLoadData('Becker_RS21_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS21__Final', false, true); 


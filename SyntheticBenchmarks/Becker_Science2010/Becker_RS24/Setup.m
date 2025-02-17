% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS24 
% Random seed:		0000124000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS24'); 

% Load the time-course data 
arLoadData('Becker_RS24_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS24__Final', false, true); 


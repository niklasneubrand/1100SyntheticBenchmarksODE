% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS41 
% Random seed:		0000141000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS41'); 

% Load the time-course data 
arLoadData('Becker_RS41_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS41__Final', false, true); 


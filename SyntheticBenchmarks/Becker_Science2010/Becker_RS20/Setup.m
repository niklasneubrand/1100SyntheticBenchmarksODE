% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS20 
% Random seed:		0000120000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS20'); 

% Load the time-course data 
arLoadData('Becker_RS20_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS20__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS47 
% Random seed:		0000147000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS47'); 

% Load the time-course data 
arLoadData('Becker_RS47_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS47__Final', false, true); 


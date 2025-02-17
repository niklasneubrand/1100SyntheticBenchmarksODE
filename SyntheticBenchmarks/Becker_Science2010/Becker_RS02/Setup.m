% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS02 
% Random seed:		0000102000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS02'); 

% Load the time-course data 
arLoadData('Becker_RS02_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS02__Final', false, true); 


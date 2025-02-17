% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS44 
% Random seed:		0000144000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS44'); 

% Load the time-course data 
arLoadData('Becker_RS44_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS44__Final', false, true); 


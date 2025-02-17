% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS42 
% Random seed:		0000142000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS42'); 

% Load the time-course data 
arLoadData('Becker_RS42_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS42__Final', false, true); 


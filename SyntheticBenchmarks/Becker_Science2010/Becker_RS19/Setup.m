% Setup File For Realistic Simulation
% Original project:	Becker_Science2010 
% RS project name:	Becker_RS19 
% Random seed:		0000119000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Becker_RS19'); 

% Load the time-course data 
arLoadData('Becker_RS19_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Becker_RS19__Final', false, true); 


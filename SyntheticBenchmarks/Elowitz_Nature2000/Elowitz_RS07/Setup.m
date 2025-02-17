% Setup File For Realistic Simulation
% Original project:	Elowitz_Nature2000 
% RS project name:	Elowitz_RS07 
% Random seed:		0000807000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Elowitz_RS07'); 

% Load the time-course data 
arLoadData('Elowitz_RS07_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Elowitz_RS07__Final', false, true); 


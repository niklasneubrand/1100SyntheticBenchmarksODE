% Setup File For Realistic Simulation
% Original project:	Elowitz_Nature2000 
% RS project name:	Elowitz_RS30 
% Random seed:		0000830000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Elowitz_RS30'); 

% Load the time-course data 
arLoadData('Elowitz_RS30_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Elowitz_RS30__Final', false, true); 


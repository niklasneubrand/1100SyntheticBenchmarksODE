% Setup File For Realistic Simulation
% Original project:	Elowitz_Nature2000 
% RS project name:	Elowitz_RS21 
% Random seed:		0000821000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Elowitz_RS21'); 

% Load the time-course data 
arLoadData('Elowitz_RS21_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Elowitz_RS21__Final', false, true); 


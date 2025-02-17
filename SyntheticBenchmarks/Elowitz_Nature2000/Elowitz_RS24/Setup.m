% Setup File For Realistic Simulation
% Original project:	Elowitz_Nature2000 
% RS project name:	Elowitz_RS24 
% Random seed:		0000824000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Elowitz_RS24'); 

% Load the time-course data 
arLoadData('Elowitz_RS24_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Elowitz_RS24__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS10 
% Random seed:		0001610000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS10'); 

% Load the time-course data 
arLoadData('Swameye_RS10_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS10__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS31 
% Random seed:		0001631000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS31'); 

% Load the time-course data 
arLoadData('Swameye_RS31_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS31__Final', false, true); 


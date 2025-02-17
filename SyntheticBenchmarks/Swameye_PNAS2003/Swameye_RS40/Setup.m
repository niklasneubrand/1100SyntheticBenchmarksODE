% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS40 
% Random seed:		0001640000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS40'); 

% Load the time-course data 
arLoadData('Swameye_RS40_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS40__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS32 
% Random seed:		0001632000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS32'); 

% Load the time-course data 
arLoadData('Swameye_RS32_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS32__Final', false, true); 


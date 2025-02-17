% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS46 
% Random seed:		0001646000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS46'); 

% Load the time-course data 
arLoadData('Swameye_RS46_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS46__Final', false, true); 


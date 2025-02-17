% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS16 
% Random seed:		0001616000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS16'); 

% Load the time-course data 
arLoadData('Swameye_RS16_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS16__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS18 
% Random seed:		0001618000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS18'); 

% Load the time-course data 
arLoadData('Swameye_RS18_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS18__Final', false, true); 


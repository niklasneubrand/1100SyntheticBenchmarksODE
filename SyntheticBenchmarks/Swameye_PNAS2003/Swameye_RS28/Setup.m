% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS28 
% Random seed:		0001628000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS28'); 

% Load the time-course data 
arLoadData('Swameye_RS28_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS28__Final', false, true); 


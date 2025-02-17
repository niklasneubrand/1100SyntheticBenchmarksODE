% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS39 
% Random seed:		0001639000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS39'); 

% Load the time-course data 
arLoadData('Swameye_RS39_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS39__Final', false, true); 


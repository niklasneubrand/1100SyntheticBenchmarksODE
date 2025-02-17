% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS04 
% Random seed:		0001604000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS04'); 

% Load the time-course data 
arLoadData('Swameye_RS04_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS04__Final', false, true); 


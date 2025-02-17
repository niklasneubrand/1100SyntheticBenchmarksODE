% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS22 
% Random seed:		0001622000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS22'); 

% Load the time-course data 
arLoadData('Swameye_RS22_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS22__Final', false, true); 


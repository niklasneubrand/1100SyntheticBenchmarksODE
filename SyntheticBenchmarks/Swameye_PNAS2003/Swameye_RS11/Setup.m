% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS11 
% Random seed:		0001611000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS11'); 

% Load the time-course data 
arLoadData('Swameye_RS11_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS11__Final', false, true); 


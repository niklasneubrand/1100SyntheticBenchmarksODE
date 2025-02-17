% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS35 
% Random seed:		0001635000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS35'); 

% Load the time-course data 
arLoadData('Swameye_RS35_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS35__Final', false, true); 


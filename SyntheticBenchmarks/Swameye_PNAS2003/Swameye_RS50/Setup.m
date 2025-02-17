% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS50 
% Random seed:		0001650000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS50'); 

% Load the time-course data 
arLoadData('Swameye_RS50_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS50__Final', false, true); 


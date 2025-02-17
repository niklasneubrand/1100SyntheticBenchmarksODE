% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS01 
% Random seed:		0001601000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS01'); 

% Load the time-course data 
arLoadData('Swameye_RS01_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS01__Final', false, true); 


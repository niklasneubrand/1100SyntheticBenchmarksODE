% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS25 
% Random seed:		0001625000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS25'); 

% Load the time-course data 
arLoadData('Swameye_RS25_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS25__Final', false, true); 


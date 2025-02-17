% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS17 
% Random seed:		0001617000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS17'); 

% Load the time-course data 
arLoadData('Swameye_RS17_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS17__Final', false, true); 


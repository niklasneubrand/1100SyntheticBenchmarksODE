% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS12 
% Random seed:		0001612000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS12'); 

% Load the time-course data 
arLoadData('Swameye_RS12_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS12__Final', false, true); 


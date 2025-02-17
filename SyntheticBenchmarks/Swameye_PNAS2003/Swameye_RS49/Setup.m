% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS49 
% Random seed:		0001649000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS49'); 

% Load the time-course data 
arLoadData('Swameye_RS49_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS49__Final', false, true); 


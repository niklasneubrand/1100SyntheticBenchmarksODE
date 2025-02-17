% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS36 
% Random seed:		0001636000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS36'); 

% Load the time-course data 
arLoadData('Swameye_RS36_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS36__Final', false, true); 


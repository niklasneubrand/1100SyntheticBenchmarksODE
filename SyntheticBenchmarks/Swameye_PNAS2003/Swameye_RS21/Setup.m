% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS21 
% Random seed:		0001621000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS21'); 

% Load the time-course data 
arLoadData('Swameye_RS21_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS21__Final', false, true); 


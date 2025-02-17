% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS23 
% Random seed:		0001623000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS23'); 

% Load the time-course data 
arLoadData('Swameye_RS23_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS23__Final', false, true); 


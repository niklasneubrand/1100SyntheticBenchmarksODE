% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS43 
% Random seed:		0001643000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS43'); 

% Load the time-course data 
arLoadData('Swameye_RS43_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS43__Final', false, true); 


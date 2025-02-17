% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS08 
% Random seed:		0001608000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS08'); 

% Load the time-course data 
arLoadData('Swameye_RS08_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS08__Final', false, true); 


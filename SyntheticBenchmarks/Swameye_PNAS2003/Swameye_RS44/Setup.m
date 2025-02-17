% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS44 
% Random seed:		0001644000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS44'); 

% Load the time-course data 
arLoadData('Swameye_RS44_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS44__Final', false, true); 


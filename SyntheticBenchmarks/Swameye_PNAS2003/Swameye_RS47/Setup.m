% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS47 
% Random seed:		0001647000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS47'); 

% Load the time-course data 
arLoadData('Swameye_RS47_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS47__Final', false, true); 


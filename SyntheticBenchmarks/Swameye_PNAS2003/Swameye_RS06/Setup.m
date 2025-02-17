% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS06 
% Random seed:		0001606000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS06'); 

% Load the time-course data 
arLoadData('Swameye_RS06_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS06__Final', false, true); 


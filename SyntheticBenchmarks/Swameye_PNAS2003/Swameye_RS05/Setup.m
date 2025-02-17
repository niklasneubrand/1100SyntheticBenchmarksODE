% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS05 
% Random seed:		0001605000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS05'); 

% Load the time-course data 
arLoadData('Swameye_RS05_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS05__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS13 
% Random seed:		0001613000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS13'); 

% Load the time-course data 
arLoadData('Swameye_RS13_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS13__Final', false, true); 


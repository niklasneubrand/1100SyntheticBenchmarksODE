% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS14 
% Random seed:		0001614000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS14'); 

% Load the time-course data 
arLoadData('Swameye_RS14_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS14__Final', false, true); 


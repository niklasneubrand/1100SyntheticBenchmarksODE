% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS30 
% Random seed:		0001630000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS30'); 

% Load the time-course data 
arLoadData('Swameye_RS30_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS30__Final', false, true); 


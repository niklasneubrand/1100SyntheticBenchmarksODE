% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS19 
% Random seed:		0001619000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS19'); 

% Load the time-course data 
arLoadData('Swameye_RS19_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS19__Final', false, true); 


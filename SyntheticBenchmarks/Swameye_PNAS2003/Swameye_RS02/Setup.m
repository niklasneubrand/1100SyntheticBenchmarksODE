% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS02 
% Random seed:		0001602000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS02'); 

% Load the time-course data 
arLoadData('Swameye_RS02_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS02__Final', false, true); 


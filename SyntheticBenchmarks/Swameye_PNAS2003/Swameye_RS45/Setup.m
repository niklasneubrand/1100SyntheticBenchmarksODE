% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS45 
% Random seed:		0001645000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS45'); 

% Load the time-course data 
arLoadData('Swameye_RS45_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS45__Final', false, true); 


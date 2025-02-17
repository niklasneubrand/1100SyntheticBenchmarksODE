% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS37 
% Random seed:		0001637000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS37'); 

% Load the time-course data 
arLoadData('Swameye_RS37_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS37__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS27 
% Random seed:		0001627000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS27'); 

% Load the time-course data 
arLoadData('Swameye_RS27_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS27__Final', false, true); 


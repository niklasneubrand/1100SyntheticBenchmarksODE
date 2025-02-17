% Setup File For Realistic Simulation
% Original project:	Swameye_PNAS2003 
% RS project name:	Swameye_RS42 
% Random seed:		0001642000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Swameye_RS42'); 

% Load the time-course data 
arLoadData('Swameye_RS42_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Swameye_RS42__Final', false, true); 


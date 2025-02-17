% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS15 
% Random seed:		0000615000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS15'); 

% Load the time-course data 
arLoadData('Bruno_RS15_TC001', 1); 
arLoadData('Bruno_RS15_TC002', 1); 
arLoadData('Bruno_RS15_TC003', 1); 
arLoadData('Bruno_RS15_TC004', 1); 
arLoadData('Bruno_RS15_TC005', 1); 
arLoadData('Bruno_RS15_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS15__Final', false, true); 


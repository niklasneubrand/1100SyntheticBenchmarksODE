% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS31 
% Random seed:		0000631000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS31'); 

% Load the time-course data 
arLoadData('Bruno_RS31_TC001', 1); 
arLoadData('Bruno_RS31_TC002', 1); 
arLoadData('Bruno_RS31_TC003', 1); 
arLoadData('Bruno_RS31_TC004', 1); 
arLoadData('Bruno_RS31_TC005', 1); 
arLoadData('Bruno_RS31_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS31__Final', false, true); 


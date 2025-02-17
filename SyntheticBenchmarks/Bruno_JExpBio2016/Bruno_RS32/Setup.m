% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS32 
% Random seed:		0000632000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS32'); 

% Load the time-course data 
arLoadData('Bruno_RS32_TC001', 1); 
arLoadData('Bruno_RS32_TC002', 1); 
arLoadData('Bruno_RS32_TC003', 1); 
arLoadData('Bruno_RS32_TC004', 1); 
arLoadData('Bruno_RS32_TC005', 1); 
arLoadData('Bruno_RS32_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS32__Final', false, true); 


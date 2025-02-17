% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS48 
% Random seed:		0000648000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS48'); 

% Load the time-course data 
arLoadData('Bruno_RS48_TC001', 1); 
arLoadData('Bruno_RS48_TC002', 1); 
arLoadData('Bruno_RS48_TC003', 1); 
arLoadData('Bruno_RS48_TC004', 1); 
arLoadData('Bruno_RS48_TC005', 1); 
arLoadData('Bruno_RS48_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS48__Final', false, true); 


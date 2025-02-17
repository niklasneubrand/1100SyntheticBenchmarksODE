% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS07 
% Random seed:		0000607000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS07'); 

% Load the time-course data 
arLoadData('Bruno_RS07_TC001', 1); 
arLoadData('Bruno_RS07_TC002', 1); 
arLoadData('Bruno_RS07_TC003', 1); 
arLoadData('Bruno_RS07_TC004', 1); 
arLoadData('Bruno_RS07_TC005', 1); 
arLoadData('Bruno_RS07_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS07__Final', false, true); 


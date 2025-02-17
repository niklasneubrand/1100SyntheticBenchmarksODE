% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS39 
% Random seed:		0000639000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS39'); 

% Load the time-course data 
arLoadData('Bruno_RS39_TC001', 1); 
arLoadData('Bruno_RS39_TC002', 1); 
arLoadData('Bruno_RS39_TC003', 1); 
arLoadData('Bruno_RS39_TC004', 1); 
arLoadData('Bruno_RS39_TC005', 1); 
arLoadData('Bruno_RS39_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS39__Final', false, true); 


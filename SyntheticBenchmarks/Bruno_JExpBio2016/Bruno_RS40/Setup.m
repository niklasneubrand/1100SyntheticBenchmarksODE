% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS40 
% Random seed:		0000640000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS40'); 

% Load the time-course data 
arLoadData('Bruno_RS40_TC001', 1); 
arLoadData('Bruno_RS40_TC002', 1); 
arLoadData('Bruno_RS40_TC003', 1); 
arLoadData('Bruno_RS40_TC004', 1); 
arLoadData('Bruno_RS40_TC005', 1); 
arLoadData('Bruno_RS40_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS40__Final', false, true); 


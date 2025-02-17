% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS29 
% Random seed:		0000629000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS29'); 

% Load the time-course data 
arLoadData('Bruno_RS29_TC001', 1); 
arLoadData('Bruno_RS29_TC002', 1); 
arLoadData('Bruno_RS29_TC003', 1); 
arLoadData('Bruno_RS29_TC004', 1); 
arLoadData('Bruno_RS29_TC005', 1); 
arLoadData('Bruno_RS29_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS29__Final', false, true); 


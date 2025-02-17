% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS10 
% Random seed:		0000610000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS10'); 

% Load the time-course data 
arLoadData('Bruno_RS10_TC001', 1); 
arLoadData('Bruno_RS10_TC002', 1); 
arLoadData('Bruno_RS10_TC003', 1); 
arLoadData('Bruno_RS10_TC004', 1); 
arLoadData('Bruno_RS10_TC005', 1); 
arLoadData('Bruno_RS10_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS10__Final', false, true); 


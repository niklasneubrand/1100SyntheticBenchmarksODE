% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS18 
% Random seed:		0000618000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS18'); 

% Load the time-course data 
arLoadData('Bruno_RS18_TC001', 1); 
arLoadData('Bruno_RS18_TC002', 1); 
arLoadData('Bruno_RS18_TC003', 1); 
arLoadData('Bruno_RS18_TC004', 1); 
arLoadData('Bruno_RS18_TC005', 1); 
arLoadData('Bruno_RS18_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS18__Final', false, true); 


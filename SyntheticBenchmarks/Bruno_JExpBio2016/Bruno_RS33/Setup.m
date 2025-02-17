% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS33 
% Random seed:		0000633000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS33'); 

% Load the time-course data 
arLoadData('Bruno_RS33_TC001', 1); 
arLoadData('Bruno_RS33_TC002', 1); 
arLoadData('Bruno_RS33_TC003', 1); 
arLoadData('Bruno_RS33_TC004', 1); 
arLoadData('Bruno_RS33_TC005', 1); 
arLoadData('Bruno_RS33_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS33__Final', false, true); 


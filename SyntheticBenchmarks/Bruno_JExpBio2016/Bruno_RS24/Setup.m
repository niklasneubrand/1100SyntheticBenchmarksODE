% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS24 
% Random seed:		0000624000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS24'); 

% Load the time-course data 
arLoadData('Bruno_RS24_TC001', 1); 
arLoadData('Bruno_RS24_TC002', 1); 
arLoadData('Bruno_RS24_TC003', 1); 
arLoadData('Bruno_RS24_TC004', 1); 
arLoadData('Bruno_RS24_TC005', 1); 
arLoadData('Bruno_RS24_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS24__Final', false, true); 


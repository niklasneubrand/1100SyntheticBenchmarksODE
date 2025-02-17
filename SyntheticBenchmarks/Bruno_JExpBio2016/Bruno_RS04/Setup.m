% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS04 
% Random seed:		0000604000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS04'); 

% Load the time-course data 
arLoadData('Bruno_RS04_TC001', 1); 
arLoadData('Bruno_RS04_TC002', 1); 
arLoadData('Bruno_RS04_TC003', 1); 
arLoadData('Bruno_RS04_TC004', 1); 
arLoadData('Bruno_RS04_TC005', 1); 
arLoadData('Bruno_RS04_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS04__Final', false, true); 


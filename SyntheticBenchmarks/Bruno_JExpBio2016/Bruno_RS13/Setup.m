% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS13 
% Random seed:		0000613000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS13'); 

% Load the time-course data 
arLoadData('Bruno_RS13_TC001', 1); 
arLoadData('Bruno_RS13_TC002', 1); 
arLoadData('Bruno_RS13_TC003', 1); 
arLoadData('Bruno_RS13_TC004', 1); 
arLoadData('Bruno_RS13_TC005', 1); 
arLoadData('Bruno_RS13_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS13__Final', false, true); 


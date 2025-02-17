% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS26 
% Random seed:		0000626000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS26'); 

% Load the time-course data 
arLoadData('Bruno_RS26_TC001', 1); 
arLoadData('Bruno_RS26_TC002', 1); 
arLoadData('Bruno_RS26_TC003', 1); 
arLoadData('Bruno_RS26_TC004', 1); 
arLoadData('Bruno_RS26_TC005', 1); 
arLoadData('Bruno_RS26_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS26__Final', false, true); 


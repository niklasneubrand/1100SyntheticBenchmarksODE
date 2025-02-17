% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS11 
% Random seed:		0000611000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS11'); 

% Load the time-course data 
arLoadData('Bruno_RS11_TC001', 1); 
arLoadData('Bruno_RS11_TC002', 1); 
arLoadData('Bruno_RS11_TC003', 1); 
arLoadData('Bruno_RS11_TC004', 1); 
arLoadData('Bruno_RS11_TC005', 1); 
arLoadData('Bruno_RS11_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS11__Final', false, true); 


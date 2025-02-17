% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS03 
% Random seed:		0000603000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS03'); 

% Load the time-course data 
arLoadData('Bruno_RS03_TC001', 1); 
arLoadData('Bruno_RS03_TC002', 1); 
arLoadData('Bruno_RS03_TC003', 1); 
arLoadData('Bruno_RS03_TC004', 1); 
arLoadData('Bruno_RS03_TC005', 1); 
arLoadData('Bruno_RS03_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS03__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS43 
% Random seed:		0000643000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS43'); 

% Load the time-course data 
arLoadData('Bruno_RS43_TC001', 1); 
arLoadData('Bruno_RS43_TC002', 1); 
arLoadData('Bruno_RS43_TC003', 1); 
arLoadData('Bruno_RS43_TC004', 1); 
arLoadData('Bruno_RS43_TC005', 1); 
arLoadData('Bruno_RS43_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS43__Final', false, true); 


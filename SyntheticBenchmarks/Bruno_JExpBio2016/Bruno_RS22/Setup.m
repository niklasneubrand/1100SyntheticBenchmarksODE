% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS22 
% Random seed:		0000622000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS22'); 

% Load the time-course data 
arLoadData('Bruno_RS22_TC001', 1); 
arLoadData('Bruno_RS22_TC002', 1); 
arLoadData('Bruno_RS22_TC003', 1); 
arLoadData('Bruno_RS22_TC004', 1); 
arLoadData('Bruno_RS22_TC005', 1); 
arLoadData('Bruno_RS22_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS22__Final', false, true); 


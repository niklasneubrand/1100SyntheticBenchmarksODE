% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS05 
% Random seed:		0000605000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS05'); 

% Load the time-course data 
arLoadData('Bruno_RS05_TC001', 1); 
arLoadData('Bruno_RS05_TC002', 1); 
arLoadData('Bruno_RS05_TC003', 1); 
arLoadData('Bruno_RS05_TC004', 1); 
arLoadData('Bruno_RS05_TC005', 1); 
arLoadData('Bruno_RS05_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS05__Final', false, true); 


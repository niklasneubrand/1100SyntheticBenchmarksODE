% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS12 
% Random seed:		0000612000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS12'); 

% Load the time-course data 
arLoadData('Bruno_RS12_TC001', 1); 
arLoadData('Bruno_RS12_TC002', 1); 
arLoadData('Bruno_RS12_TC003', 1); 
arLoadData('Bruno_RS12_TC004', 1); 
arLoadData('Bruno_RS12_TC005', 1); 
arLoadData('Bruno_RS12_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS12__Final', false, true); 


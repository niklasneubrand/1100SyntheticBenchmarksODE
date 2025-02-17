% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS30 
% Random seed:		0000630000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS30'); 

% Load the time-course data 
arLoadData('Bruno_RS30_TC001', 1); 
arLoadData('Bruno_RS30_TC002', 1); 
arLoadData('Bruno_RS30_TC003', 1); 
arLoadData('Bruno_RS30_TC004', 1); 
arLoadData('Bruno_RS30_TC005', 1); 
arLoadData('Bruno_RS30_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS30__Final', false, true); 


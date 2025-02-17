% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS01 
% Random seed:		0000601000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS01'); 

% Load the time-course data 
arLoadData('Bruno_RS01_TC001', 1); 
arLoadData('Bruno_RS01_TC002', 1); 
arLoadData('Bruno_RS01_TC003', 1); 
arLoadData('Bruno_RS01_TC004', 1); 
arLoadData('Bruno_RS01_TC005', 1); 
arLoadData('Bruno_RS01_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS01__Final', false, true); 


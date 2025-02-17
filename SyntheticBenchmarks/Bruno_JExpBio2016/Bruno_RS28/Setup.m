% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS28 
% Random seed:		0000628000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS28'); 

% Load the time-course data 
arLoadData('Bruno_RS28_TC001', 1); 
arLoadData('Bruno_RS28_TC002', 1); 
arLoadData('Bruno_RS28_TC003', 1); 
arLoadData('Bruno_RS28_TC004', 1); 
arLoadData('Bruno_RS28_TC005', 1); 
arLoadData('Bruno_RS28_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS28__Final', false, true); 


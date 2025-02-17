% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS41 
% Random seed:		0000641000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS41'); 

% Load the time-course data 
arLoadData('Bruno_RS41_TC001', 1); 
arLoadData('Bruno_RS41_TC002', 1); 
arLoadData('Bruno_RS41_TC003', 1); 
arLoadData('Bruno_RS41_TC004', 1); 
arLoadData('Bruno_RS41_TC005', 1); 
arLoadData('Bruno_RS41_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS41__Final', false, true); 


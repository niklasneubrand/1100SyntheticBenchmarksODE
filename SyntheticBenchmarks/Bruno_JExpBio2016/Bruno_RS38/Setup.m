% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS38 
% Random seed:		0000638000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS38'); 

% Load the time-course data 
arLoadData('Bruno_RS38_TC001', 1); 
arLoadData('Bruno_RS38_TC002', 1); 
arLoadData('Bruno_RS38_TC003', 1); 
arLoadData('Bruno_RS38_TC004', 1); 
arLoadData('Bruno_RS38_TC005', 1); 
arLoadData('Bruno_RS38_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS38__Final', false, true); 


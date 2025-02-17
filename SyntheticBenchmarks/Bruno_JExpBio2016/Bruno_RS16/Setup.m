% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS16 
% Random seed:		0000616000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS16'); 

% Load the time-course data 
arLoadData('Bruno_RS16_TC001', 1); 
arLoadData('Bruno_RS16_TC002', 1); 
arLoadData('Bruno_RS16_TC003', 1); 
arLoadData('Bruno_RS16_TC004', 1); 
arLoadData('Bruno_RS16_TC005', 1); 
arLoadData('Bruno_RS16_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS16__Final', false, true); 


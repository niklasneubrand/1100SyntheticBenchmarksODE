% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS23 
% Random seed:		0000623000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS23'); 

% Load the time-course data 
arLoadData('Bruno_RS23_TC001', 1); 
arLoadData('Bruno_RS23_TC002', 1); 
arLoadData('Bruno_RS23_TC003', 1); 
arLoadData('Bruno_RS23_TC004', 1); 
arLoadData('Bruno_RS23_TC005', 1); 
arLoadData('Bruno_RS23_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS23__Final', false, true); 


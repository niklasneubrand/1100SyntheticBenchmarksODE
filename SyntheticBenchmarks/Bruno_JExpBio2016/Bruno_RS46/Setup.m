% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS46 
% Random seed:		0000646000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS46'); 

% Load the time-course data 
arLoadData('Bruno_RS46_TC001', 1); 
arLoadData('Bruno_RS46_TC002', 1); 
arLoadData('Bruno_RS46_TC003', 1); 
arLoadData('Bruno_RS46_TC004', 1); 
arLoadData('Bruno_RS46_TC005', 1); 
arLoadData('Bruno_RS46_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS46__Final', false, true); 


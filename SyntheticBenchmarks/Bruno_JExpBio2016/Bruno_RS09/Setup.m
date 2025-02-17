% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS09 
% Random seed:		0000609000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS09'); 

% Load the time-course data 
arLoadData('Bruno_RS09_TC001', 1); 
arLoadData('Bruno_RS09_TC002', 1); 
arLoadData('Bruno_RS09_TC003', 1); 
arLoadData('Bruno_RS09_TC004', 1); 
arLoadData('Bruno_RS09_TC005', 1); 
arLoadData('Bruno_RS09_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS09__Final', false, true); 


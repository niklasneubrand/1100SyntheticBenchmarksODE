% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS50 
% Random seed:		0000650000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS50'); 

% Load the time-course data 
arLoadData('Bruno_RS50_TC001', 1); 
arLoadData('Bruno_RS50_TC002', 1); 
arLoadData('Bruno_RS50_TC003', 1); 
arLoadData('Bruno_RS50_TC004', 1); 
arLoadData('Bruno_RS50_TC005', 1); 
arLoadData('Bruno_RS50_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS50__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS45 
% Random seed:		0000645000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS45'); 

% Load the time-course data 
arLoadData('Bruno_RS45_TC001', 1); 
arLoadData('Bruno_RS45_TC002', 1); 
arLoadData('Bruno_RS45_TC003', 1); 
arLoadData('Bruno_RS45_TC004', 1); 
arLoadData('Bruno_RS45_TC005', 1); 
arLoadData('Bruno_RS45_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS45__Final', false, true); 


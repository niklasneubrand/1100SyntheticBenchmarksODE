% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS49 
% Random seed:		0000649000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS49'); 

% Load the time-course data 
arLoadData('Bruno_RS49_TC001', 1); 
arLoadData('Bruno_RS49_TC002', 1); 
arLoadData('Bruno_RS49_TC003', 1); 
arLoadData('Bruno_RS49_TC004', 1); 
arLoadData('Bruno_RS49_TC005', 1); 
arLoadData('Bruno_RS49_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS49__Final', false, true); 


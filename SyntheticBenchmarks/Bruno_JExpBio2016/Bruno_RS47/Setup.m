% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS47 
% Random seed:		0000647000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS47'); 

% Load the time-course data 
arLoadData('Bruno_RS47_TC001', 1); 
arLoadData('Bruno_RS47_TC002', 1); 
arLoadData('Bruno_RS47_TC003', 1); 
arLoadData('Bruno_RS47_TC004', 1); 
arLoadData('Bruno_RS47_TC005', 1); 
arLoadData('Bruno_RS47_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS47__Final', false, true); 


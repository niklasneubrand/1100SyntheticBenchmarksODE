% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS06 
% Random seed:		0000606000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS06'); 

% Load the time-course data 
arLoadData('Bruno_RS06_TC001', 1); 
arLoadData('Bruno_RS06_TC002', 1); 
arLoadData('Bruno_RS06_TC003', 1); 
arLoadData('Bruno_RS06_TC004', 1); 
arLoadData('Bruno_RS06_TC005', 1); 
arLoadData('Bruno_RS06_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS06__Final', false, true); 


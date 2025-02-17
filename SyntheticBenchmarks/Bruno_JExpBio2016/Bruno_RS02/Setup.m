% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS02 
% Random seed:		0000602000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS02'); 

% Load the time-course data 
arLoadData('Bruno_RS02_TC001', 1); 
arLoadData('Bruno_RS02_TC002', 1); 
arLoadData('Bruno_RS02_TC003', 1); 
arLoadData('Bruno_RS02_TC004', 1); 
arLoadData('Bruno_RS02_TC005', 1); 
arLoadData('Bruno_RS02_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS02__Final', false, true); 


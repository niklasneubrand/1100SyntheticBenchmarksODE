% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS19 
% Random seed:		0000619000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS19'); 

% Load the time-course data 
arLoadData('Bruno_RS19_TC001', 1); 
arLoadData('Bruno_RS19_TC002', 1); 
arLoadData('Bruno_RS19_TC003', 1); 
arLoadData('Bruno_RS19_TC004', 1); 
arLoadData('Bruno_RS19_TC005', 1); 
arLoadData('Bruno_RS19_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS19__Final', false, true); 


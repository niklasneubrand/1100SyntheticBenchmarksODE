% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS35 
% Random seed:		0000635000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS35'); 

% Load the time-course data 
arLoadData('Bruno_RS35_TC001', 1); 
arLoadData('Bruno_RS35_TC002', 1); 
arLoadData('Bruno_RS35_TC003', 1); 
arLoadData('Bruno_RS35_TC004', 1); 
arLoadData('Bruno_RS35_TC005', 1); 
arLoadData('Bruno_RS35_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS35__Final', false, true); 


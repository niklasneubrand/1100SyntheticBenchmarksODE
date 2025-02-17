% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS14 
% Random seed:		0000614000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS14'); 

% Load the time-course data 
arLoadData('Bruno_RS14_TC001', 1); 
arLoadData('Bruno_RS14_TC002', 1); 
arLoadData('Bruno_RS14_TC003', 1); 
arLoadData('Bruno_RS14_TC004', 1); 
arLoadData('Bruno_RS14_TC005', 1); 
arLoadData('Bruno_RS14_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS14__Final', false, true); 


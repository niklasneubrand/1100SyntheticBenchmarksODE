% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS21 
% Random seed:		0000621000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS21'); 

% Load the time-course data 
arLoadData('Bruno_RS21_TC001', 1); 
arLoadData('Bruno_RS21_TC002', 1); 
arLoadData('Bruno_RS21_TC003', 1); 
arLoadData('Bruno_RS21_TC004', 1); 
arLoadData('Bruno_RS21_TC005', 1); 
arLoadData('Bruno_RS21_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS21__Final', false, true); 


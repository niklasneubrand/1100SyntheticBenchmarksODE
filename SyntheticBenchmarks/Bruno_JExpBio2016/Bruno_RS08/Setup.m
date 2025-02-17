% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS08 
% Random seed:		0000608000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS08'); 

% Load the time-course data 
arLoadData('Bruno_RS08_TC001', 1); 
arLoadData('Bruno_RS08_TC002', 1); 
arLoadData('Bruno_RS08_TC003', 1); 
arLoadData('Bruno_RS08_TC004', 1); 
arLoadData('Bruno_RS08_TC005', 1); 
arLoadData('Bruno_RS08_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS08__Final', false, true); 


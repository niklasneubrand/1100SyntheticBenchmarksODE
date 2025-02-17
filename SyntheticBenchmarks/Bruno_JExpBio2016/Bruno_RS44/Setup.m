% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS44 
% Random seed:		0000644000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS44'); 

% Load the time-course data 
arLoadData('Bruno_RS44_TC001', 1); 
arLoadData('Bruno_RS44_TC002', 1); 
arLoadData('Bruno_RS44_TC003', 1); 
arLoadData('Bruno_RS44_TC004', 1); 
arLoadData('Bruno_RS44_TC005', 1); 
arLoadData('Bruno_RS44_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS44__Final', false, true); 


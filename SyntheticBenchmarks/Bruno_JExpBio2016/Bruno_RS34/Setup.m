% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS34 
% Random seed:		0000634000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS34'); 

% Load the time-course data 
arLoadData('Bruno_RS34_TC001', 1); 
arLoadData('Bruno_RS34_TC002', 1); 
arLoadData('Bruno_RS34_TC003', 1); 
arLoadData('Bruno_RS34_TC004', 1); 
arLoadData('Bruno_RS34_TC005', 1); 
arLoadData('Bruno_RS34_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS34__Final', false, true); 


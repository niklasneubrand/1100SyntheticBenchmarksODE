% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS37 
% Random seed:		0000637000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS37'); 

% Load the time-course data 
arLoadData('Bruno_RS37_TC001', 1); 
arLoadData('Bruno_RS37_TC002', 1); 
arLoadData('Bruno_RS37_TC003', 1); 
arLoadData('Bruno_RS37_TC004', 1); 
arLoadData('Bruno_RS37_TC005', 1); 
arLoadData('Bruno_RS37_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS37__Final', false, true); 


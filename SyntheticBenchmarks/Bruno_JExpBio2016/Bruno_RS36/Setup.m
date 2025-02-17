% Setup File For Realistic Simulation
% Original project:	Bruno_JExpBio2016 
% RS project name:	Bruno_RS36 
% Random seed:		0000636000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bruno_RS36'); 

% Load the time-course data 
arLoadData('Bruno_RS36_TC001', 1); 
arLoadData('Bruno_RS36_TC002', 1); 
arLoadData('Bruno_RS36_TC003', 1); 
arLoadData('Bruno_RS36_TC004', 1); 
arLoadData('Bruno_RS36_TC005', 1); 
arLoadData('Bruno_RS36_TC006', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bruno_RS36__Final', false, true); 


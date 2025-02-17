% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS18 
% Random seed:		0000918000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS18'); 

% Load the time-course data 
arLoadData('Fiedler_RS18_TC001', 1); 
arLoadData('Fiedler_RS18_TC002', 1); 
arLoadData('Fiedler_RS18_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS18__Final', false, true); 


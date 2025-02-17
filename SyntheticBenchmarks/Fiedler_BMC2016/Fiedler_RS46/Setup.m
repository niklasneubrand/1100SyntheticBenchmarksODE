% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS46 
% Random seed:		0000946000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS46'); 

% Load the time-course data 
arLoadData('Fiedler_RS46_TC001', 1); 
arLoadData('Fiedler_RS46_TC002', 1); 
arLoadData('Fiedler_RS46_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS46__Final', false, true); 


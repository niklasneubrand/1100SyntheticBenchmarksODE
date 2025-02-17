% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS23 
% Random seed:		0000923000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS23'); 

% Load the time-course data 
arLoadData('Fiedler_RS23_TC001', 1); 
arLoadData('Fiedler_RS23_TC002', 1); 
arLoadData('Fiedler_RS23_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS23__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS10 
% Random seed:		0000910000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS10'); 

% Load the time-course data 
arLoadData('Fiedler_RS10_TC001', 1); 
arLoadData('Fiedler_RS10_TC002', 1); 
arLoadData('Fiedler_RS10_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS10__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS26 
% Random seed:		0000926000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS26'); 

% Load the time-course data 
arLoadData('Fiedler_RS26_TC001', 1); 
arLoadData('Fiedler_RS26_TC002', 1); 
arLoadData('Fiedler_RS26_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS26__Final', false, true); 


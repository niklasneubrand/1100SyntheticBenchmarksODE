% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS17 
% Random seed:		0000917000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS17'); 

% Load the time-course data 
arLoadData('Fiedler_RS17_TC001', 1); 
arLoadData('Fiedler_RS17_TC002', 1); 
arLoadData('Fiedler_RS17_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS17__Final', false, true); 


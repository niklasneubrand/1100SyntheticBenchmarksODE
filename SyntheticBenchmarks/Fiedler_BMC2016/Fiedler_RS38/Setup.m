% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS38 
% Random seed:		0000938000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS38'); 

% Load the time-course data 
arLoadData('Fiedler_RS38_TC001', 1); 
arLoadData('Fiedler_RS38_TC002', 1); 
arLoadData('Fiedler_RS38_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS38__Final', false, true); 


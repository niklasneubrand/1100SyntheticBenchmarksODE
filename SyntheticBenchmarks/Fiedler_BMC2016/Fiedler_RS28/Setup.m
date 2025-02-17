% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS28 
% Random seed:		0000928000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS28'); 

% Load the time-course data 
arLoadData('Fiedler_RS28_TC001', 1); 
arLoadData('Fiedler_RS28_TC002', 1); 
arLoadData('Fiedler_RS28_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS28__Final', false, true); 


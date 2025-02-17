% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS40 
% Random seed:		0000940000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS40'); 

% Load the time-course data 
arLoadData('Fiedler_RS40_TC001', 1); 
arLoadData('Fiedler_RS40_TC002', 1); 
arLoadData('Fiedler_RS40_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS40__Final', false, true); 


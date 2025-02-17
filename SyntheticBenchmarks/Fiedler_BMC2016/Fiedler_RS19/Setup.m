% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS19 
% Random seed:		0000919000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS19'); 

% Load the time-course data 
arLoadData('Fiedler_RS19_TC001', 1); 
arLoadData('Fiedler_RS19_TC002', 1); 
arLoadData('Fiedler_RS19_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS19__Final', false, true); 


% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS06 
% Random seed:		0000906000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS06'); 

% Load the time-course data 
arLoadData('Fiedler_RS06_TC001', 1); 
arLoadData('Fiedler_RS06_TC002', 1); 
arLoadData('Fiedler_RS06_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS06__Final', false, true); 


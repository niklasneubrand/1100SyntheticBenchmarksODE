% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS43 
% Random seed:		0000943000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS43'); 

% Load the time-course data 
arLoadData('Fiedler_RS43_TC001', 1); 
arLoadData('Fiedler_RS43_TC002', 1); 
arLoadData('Fiedler_RS43_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS43__Final', false, true); 


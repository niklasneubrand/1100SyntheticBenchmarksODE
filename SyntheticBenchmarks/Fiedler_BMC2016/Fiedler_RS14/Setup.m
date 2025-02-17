% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS14 
% Random seed:		0000914000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS14'); 

% Load the time-course data 
arLoadData('Fiedler_RS14_TC001', 1); 
arLoadData('Fiedler_RS14_TC002', 1); 
arLoadData('Fiedler_RS14_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS14__Final', false, true); 


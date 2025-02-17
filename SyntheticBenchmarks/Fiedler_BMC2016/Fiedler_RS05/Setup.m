% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS05 
% Random seed:		0000905000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS05'); 

% Load the time-course data 
arLoadData('Fiedler_RS05_TC001', 1); 
arLoadData('Fiedler_RS05_TC002', 1); 
arLoadData('Fiedler_RS05_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS05__Final', false, true); 


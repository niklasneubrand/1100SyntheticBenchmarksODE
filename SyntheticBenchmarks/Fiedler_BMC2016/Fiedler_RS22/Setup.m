% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS22 
% Random seed:		0000922000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS22'); 

% Load the time-course data 
arLoadData('Fiedler_RS22_TC001', 1); 
arLoadData('Fiedler_RS22_TC002', 1); 
arLoadData('Fiedler_RS22_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS22__Final', false, true); 


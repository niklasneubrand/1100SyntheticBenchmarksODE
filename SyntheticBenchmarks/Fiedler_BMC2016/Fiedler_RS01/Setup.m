% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS01 
% Random seed:		0000901000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS01'); 

% Load the time-course data 
arLoadData('Fiedler_RS01_TC001', 1); 
arLoadData('Fiedler_RS01_TC002', 1); 
arLoadData('Fiedler_RS01_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS01__Final', false, true); 


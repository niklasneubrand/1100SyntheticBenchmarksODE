% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS25 
% Random seed:		0000925000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS25'); 

% Load the time-course data 
arLoadData('Fiedler_RS25_TC001', 1); 
arLoadData('Fiedler_RS25_TC002', 1); 
arLoadData('Fiedler_RS25_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS25__Final', false, true); 


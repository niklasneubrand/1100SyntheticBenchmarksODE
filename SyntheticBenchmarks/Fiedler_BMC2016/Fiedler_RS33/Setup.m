% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS33 
% Random seed:		0000933000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS33'); 

% Load the time-course data 
arLoadData('Fiedler_RS33_TC001', 1); 
arLoadData('Fiedler_RS33_TC002', 1); 
arLoadData('Fiedler_RS33_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS33__Final', false, true); 


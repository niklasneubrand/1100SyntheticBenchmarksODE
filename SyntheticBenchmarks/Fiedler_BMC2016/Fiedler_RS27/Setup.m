% Setup File For Realistic Simulation
% Original project:	Fiedler_BMC2016 
% RS project name:	Fiedler_RS27 
% Random seed:		0000927000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Fiedler_RS27'); 

% Load the time-course data 
arLoadData('Fiedler_RS27_TC001', 1); 
arLoadData('Fiedler_RS27_TC002', 1); 
arLoadData('Fiedler_RS27_TC003', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Fiedler_RS27__Final', false, true); 


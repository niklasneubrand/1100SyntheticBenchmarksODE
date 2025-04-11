% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS40 
% Random seed:		0001940000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS40'); 

% Load the time-course data 
arLoadData('Bachmann_RS40_TC001', 1); 
arLoadData('Bachmann_RS40_TC002', 1); 
arLoadData('Bachmann_RS40_TC003', 1); 
arLoadData('Bachmann_RS40_TC004', 1); 
arLoadData('Bachmann_RS40_TC005', 1); 
arLoadData('Bachmann_RS40_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS40_DR001', 1); 
arLoadData('Bachmann_RS40_DR002', 1); 
arLoadData('Bachmann_RS40_DR003', 1); 
arLoadData('Bachmann_RS40_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS40__Final', false, true); 


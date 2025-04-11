% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS07 
% Random seed:		0001907000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS07'); 

% Load the time-course data 
arLoadData('Bachmann_RS07_TC001', 1); 
arLoadData('Bachmann_RS07_TC002', 1); 
arLoadData('Bachmann_RS07_TC003', 1); 
arLoadData('Bachmann_RS07_TC004', 1); 
arLoadData('Bachmann_RS07_TC005', 1); 
arLoadData('Bachmann_RS07_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS07_DR001', 1); 
arLoadData('Bachmann_RS07_DR002', 1); 
arLoadData('Bachmann_RS07_DR003', 1); 
arLoadData('Bachmann_RS07_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS07__Final', false, true); 


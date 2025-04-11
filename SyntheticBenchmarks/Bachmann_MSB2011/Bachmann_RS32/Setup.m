% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS32 
% Random seed:		0001932000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS32'); 

% Load the time-course data 
arLoadData('Bachmann_RS32_TC001', 1); 
arLoadData('Bachmann_RS32_TC002', 1); 
arLoadData('Bachmann_RS32_TC003', 1); 
arLoadData('Bachmann_RS32_TC004', 1); 
arLoadData('Bachmann_RS32_TC005', 1); 
arLoadData('Bachmann_RS32_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS32_DR001', 1); 
arLoadData('Bachmann_RS32_DR002', 1); 
arLoadData('Bachmann_RS32_DR003', 1); 
arLoadData('Bachmann_RS32_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS32__Final', false, true); 


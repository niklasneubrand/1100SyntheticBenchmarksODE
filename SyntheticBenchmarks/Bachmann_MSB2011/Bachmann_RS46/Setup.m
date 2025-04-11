% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS46 
% Random seed:		0001946000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS46'); 

% Load the time-course data 
arLoadData('Bachmann_RS46_TC001', 1); 
arLoadData('Bachmann_RS46_TC002', 1); 
arLoadData('Bachmann_RS46_TC003', 1); 
arLoadData('Bachmann_RS46_TC004', 1); 
arLoadData('Bachmann_RS46_TC005', 1); 
arLoadData('Bachmann_RS46_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS46_DR001', 1); 
arLoadData('Bachmann_RS46_DR002', 1); 
arLoadData('Bachmann_RS46_DR003', 1); 
arLoadData('Bachmann_RS46_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS46__Final', false, true); 


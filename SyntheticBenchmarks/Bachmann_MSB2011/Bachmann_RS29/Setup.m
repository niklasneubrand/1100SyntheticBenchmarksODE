% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS29 
% Random seed:		0001929000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS29'); 

% Load the time-course data 
arLoadData('Bachmann_RS29_TC001', 1); 
arLoadData('Bachmann_RS29_TC002', 1); 
arLoadData('Bachmann_RS29_TC003', 1); 
arLoadData('Bachmann_RS29_TC004', 1); 
arLoadData('Bachmann_RS29_TC005', 1); 
arLoadData('Bachmann_RS29_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS29_DR001', 1); 
arLoadData('Bachmann_RS29_DR002', 1); 
arLoadData('Bachmann_RS29_DR003', 1); 
arLoadData('Bachmann_RS29_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS29__Final', false, true); 


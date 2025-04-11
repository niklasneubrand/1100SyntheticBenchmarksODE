% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS10 
% Random seed:		0001910000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS10'); 

% Load the time-course data 
arLoadData('Bachmann_RS10_TC001', 1); 
arLoadData('Bachmann_RS10_TC002', 1); 
arLoadData('Bachmann_RS10_TC003', 1); 
arLoadData('Bachmann_RS10_TC004', 1); 
arLoadData('Bachmann_RS10_TC005', 1); 
arLoadData('Bachmann_RS10_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS10_DR001', 1); 
arLoadData('Bachmann_RS10_DR002', 1); 
arLoadData('Bachmann_RS10_DR003', 1); 
arLoadData('Bachmann_RS10_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS10__Final', false, true); 

